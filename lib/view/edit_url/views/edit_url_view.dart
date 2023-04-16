import 'package:flutter/material.dart';

import '../../../core/base/view/base_widget.dart';
import '../service/edit_url_service.dart';
import '../viewmodel/edit_url_view_model.dart';

class EditUrlView extends StatefulWidget {
  const EditUrlView({super.key});

  @override
  State<EditUrlView> createState() => _EditUrlViewState();
}

class _EditUrlViewState extends State<EditUrlView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<EditUrlViewModel>(
      viewModel: EditUrlViewModel(EditUrlService()),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: _buildScaffoldBody,
    );
  }

  Widget _buildScaffoldBody(BuildContext context, EditUrlViewModel viewModel) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const SizedBox.shrink()
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: const SizedBox.shrink(),
      backgroundColor: Colors.transparent,
      title: Text(
        "Cập nhật URL",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}