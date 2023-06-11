import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_school/view/create_school/model/school_model.dart';
import 'package:smart_school/view/menu/model/subject_model.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/constants/enums/locale_keys_enum.dart';
import '../service/menu_service.dart';

part 'menu_view_model.g.dart'; // This is the generated file.

// ignore: library_private_types_in_public_api
class MenuViewModel = _MenuViewModel with _$MenuViewModel;

abstract class _MenuViewModel with Store, BaseViewModel {
  _MenuViewModel(this._menuService, this._schoolModel);

  final MenuServices _menuService;
  final SchoolModel? _schoolModel;

  @observable
  List<SubjectModel> listSubject = [];
  @observable
  List<SubjectModel> listFeedback = [];

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _getListMenu();
  }

  Future<void> _getListMenu() async {
    if (_schoolModel == null) {
      return;
    }
    _schoolModel!.subjects
        ?.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
    listSubject = _schoolModel!.subjects
            ?.where((e) => e.type == MenuType.subject)
            .toList() ??
        [];
    listFeedback = _schoolModel!.subjects
            ?.where((e) => e.type == MenuType.feedback)
            .toList() ??
        [];
  }

  void onSelectMenu(SubjectModel? item) {
    navigation.navigateToPage(path: NavigationConstants.WEB_VIEW, data: item);
  }

  void onLogout() {
    navigation.navigateToPageClear(path: NavigationConstants.DEFAULT);
  }
}
