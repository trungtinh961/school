import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_school/core/constants/enums/locale_keys_enum.dart';
import 'package:smart_school/view/create_school/model/province_model.dart';
import 'package:smart_school/view/create_school/service/create_school_service.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';

part 'create_school_viewmodel.g.dart';

class CreateSchoolViewModel = _CreateSchoolViewModel
    with _$CreateSchoolViewModel;

abstract class _CreateSchoolViewModel with Store, BaseViewModel {
  _CreateSchoolViewModel(this._createSchoolService);

  final CreateSchoolService _createSchoolService;
  @observable
  List<ProvinceModel> provinceList = [];

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _createSchoolService.getListProvince().then((value) {
      provinceList = value;
    });
    _createSchoolService.getListSchool().then((value) {});
  }

  void createSchool(String name, ProvinceModel? province) {
    _createSchoolService.createSchool(name, province).then((value) {
      localeManager.setStringValue(PreferencesKeys.SCHOOL_ID, value.id);
      navigation.navigateToPageClear(path: NavigationConstants.MENU_VIEW);
    }).catchError((e) => log(e));
  }
}
