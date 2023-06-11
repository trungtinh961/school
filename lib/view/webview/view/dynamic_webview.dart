import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/base/view/base_widget.dart';
import '../../menu/model/subject_model.dart';
import '../viewmodel/webview_view_model.dart';

class DynamicWebView extends StatefulWidget {
  const DynamicWebView({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SubjectModel model;

  @override
  State<DynamicWebView> createState() => _DynamicWebViewState();
}

class _DynamicWebViewState extends State<DynamicWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFFFFFFFF))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://drive.google.com/') ||
                request.url.startsWith('https://forms.gle/') ||
                request.url.startsWith('https://docs.google.com/')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.model.url.isNullOrEmpty
            ? 'https://'
            : widget.model.url ?? ''),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<WebviewViewModel>(
      viewModel: WebviewViewModel(widget.model),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, WebviewViewModel viewModel) =>
          Container(
        color: context.colorScheme.background,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.model.name ?? '',
              style: context.textTheme.headlineSmall
                  ?.copyWith(color: Colors.white),
            ),
            actions: [
              viewModel.canEdit()
                  ? IconButton(
                      onPressed: viewModel.onEdit,
                      icon: const Icon(Icons.edit),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          body: (widget.model.url ?? '').isEmpty
              ? Center(
                  child: Text(
                    'Chưa có dữ liệu',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              : WebViewWidget(controller: _controller),
        ),
      ),
    );
  }
}
