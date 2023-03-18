import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:smart_school/view/subject_detail/view/subject_content_item_view.dart';

import '../../../core/base/view/base_widget.dart';
import '../../menu/model/menu_model.dart';
import '../viewmodel/subject_content_view_model.dart';

class SubjectContentView extends StatelessWidget {
  const SubjectContentView({
    Key? key,
    required this.menuItem,
  }) : super(key: key);

  final MenuModel? menuItem;

  @override
  Widget build(BuildContext context) {
    return BaseView<SubjectContentViewModel>(
      viewModel: SubjectContentViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, SubjectContentViewModel viewModel) =>
              Container(
        color: context.colorScheme.background,
        padding: context.paddingLow,
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
      backgroundColor: Colors.transparent,
      title: Text(
        menuItem?.name ?? "",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _buildListViewContent(SubjectContentViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.listContent.length,
      itemBuilder: (context, index) {
        return SubjectContentItemView(
          type: viewModel.listContent[index],
        );
      },
    );
  }
}
