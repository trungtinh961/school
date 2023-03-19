import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
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
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: context.colorScheme.background,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildMenuListView(viewModel),
            ),
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
        "THPT Cái Bè",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget _buildMenuListView(MenuViewModel viewModel) {
    return Observer(
      builder: (_) => GridView.builder(
        itemCount: viewModel.listMenu.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return MenuItemView(
            item: viewModel.listMenu[index],
            onSelected: viewModel.onSelectMenu,
          );
        },
      ),
    );
  }
}
