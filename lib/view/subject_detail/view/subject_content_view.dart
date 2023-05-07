import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:smart_school/view/subject_detail/view/subject_content_item_view.dart';

import '../../../core/base/view/base_widget.dart';
import '../../menu/model/subject_model.dart';
import '../viewmodel/subject_content_view_model.dart';

class SubjectContentView extends StatelessWidget {
  const SubjectContentView({
    Key? key,
    required this.menuItem,
  }) : super(key: key);

  final SubjectModel? menuItem;

  @override
  Widget build(BuildContext context) {
    return BaseView<SubjectContentViewModel>(
      viewModel: SubjectContentViewModel(model: menuItem),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, SubjectContentViewModel viewModel) =>
              Container(
        color: context.colorScheme.background,
        child: Scaffold(
          appBar: buildAppBar(context),
          body: Observer(
            builder: (_) => _buildListViewContent(viewModel),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        menuItem?.name ?? "",
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _buildListViewContent(SubjectContentViewModel viewModel) {
    final listContent = viewModel.model?.content ?? [];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 20.0,
      ),
      child: ListView.builder(
        itemCount: listContent.length,
        itemBuilder: (context, index) {
          return SubjectContentItemView(
            subContentModel: listContent[index],
            onPressed: viewModel.onSelectMenu,
          );
        },
      ),
    );
  }
}
