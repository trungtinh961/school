import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:smart_school/view/create_school/service/create_school_service.dart';
import 'package:smart_school/view/select_school/view/school_item_view.dart';

import '../../../core/base/view/base_widget.dart';
import '../viewmodel/select_school_view_model.dart';

class SelectSchoolView extends StatelessWidget {
  const SelectSchoolView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectSchoolViewModel>(
      viewModel: SelectSchoolViewModel(CreateSchoolService()),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SelectSchoolViewModel viewModel) =>
          Container(
        color: context.colorScheme.background,
        child: Scaffold(
          appBar: buildAppBar(context),
          body: _buildListViewContent(viewModel),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Chọn trường",
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _buildListViewContent(SelectSchoolViewModel viewModel) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 20.0,
        ),
        child: ListView.builder(
          itemCount: viewModel.schoolList.length,
          itemBuilder: (context, index) {
            return SchoolItemView(
              schoolItem: viewModel.schoolList[index],
              onPressed: viewModel.onSelectSchool,
            );
          },
        ),
      ),
    );
  }
}
