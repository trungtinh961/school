import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:smart_school/view/menu/model/subject_model.dart';
import 'package:smart_school/view/menu/service/menu_service.dart';

import '../../../core/base/view/base_widget.dart';
import '../viewmodel/menu_view_model.dart';
import 'menu_item_view.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MenuViewModel>(
      viewModel: MenuViewModel(MenuServices()),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: _buildScaffoldBody,
    );
  }

  Widget _buildScaffoldBody(BuildContext context, MenuViewModel viewModel) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: TabBarView(
          children: [
            _buildMenuListView(viewModel, MenuType.subject),
            _buildMenuListView(viewModel, MenuType.feedback),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: const SizedBox.shrink(),
      backgroundColor: Colors.transparent,
      title: Text(
        "THPT ..........",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      bottom: const TabBar(
        tabs: [
          Tab(text: 'Môn học'),
          Tab(text: 'Góp ý'),
        ],
      ),
    );
  }

  Widget _buildMenuListView(MenuViewModel viewModel, MenuType type) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: type == MenuType.subject
              ? viewModel.listSubject.length
              : viewModel.listFeedback.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return MenuItemView(
              item: type == MenuType.subject
                  ? viewModel.listSubject[index]
                  : viewModel.listFeedback[index],
              onSelected: viewModel.onSelectMenu,
            );
          },
        ),
      ),
    );
  }
}
