import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_school/view/menu/model/subject_model.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../webview/webview_model.dart';
import '../service/menu_service.dart';

part 'menu_view_model.g.dart'; // This is the generated file.

// ignore: library_private_types_in_public_api
class MenuViewModel = _MenuViewModel with _$MenuViewModel;

abstract class _MenuViewModel with Store, BaseViewModel {
  _MenuViewModel(this._menuService);

  final MenuServices _menuService;

  @observable
  List<SubjectModel> listMenu = [];

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _getListMenu();
  }

  Future<void> _getListMenu() async {
    final response = await _menuService.readItems();
    listMenu = response;
  }

  void onSelectMenu(SubjectModel? item) {
    switch (item?.type) {
      case MenuType.subject:
        navigation.navigateToPage(
            path: NavigationConstants.SUBJECT_CONTENT_VIEW, data: item);
        break;
      case MenuType.feedback:
        navigation.navigateToPage(
            path: NavigationConstants.WEB_VIEW,
            data: WebViewModel(
              item?.name ?? '',
              url: item?.url,
            ));
        break;
      default:
    }
  }
}
