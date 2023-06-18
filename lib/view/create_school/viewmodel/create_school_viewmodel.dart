import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_school/core/constants/enums/locale_keys_enum.dart';
import 'package:smart_school/view/create_school/model/province_model.dart';
import 'package:smart_school/view/create_school/model/school_model.dart';
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
  List<SchoolModel> schoolList = [];

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _createSchoolService.getListProvince().then((value) {
      provinceList = value;
    });
    _createSchoolService.getListSchool().then((value) {
      schoolList = value;
    });
  }

  Future<void> createSchool(String name, ProvinceModel? province) async {
    if (schoolList.any((element) =>
        element.name?.toLowerCase() == name.toLowerCase() &&
        element.province?.code == province?.code)) {
      showErrorSnackBar('Trường đã tồn tại');
      return;
    }

    final school = await _createSchoolService.createSchool(name, province);
    localeManager.setStringValue(PreferencesKeys.SCHOOL_ID, school.id ?? '');
    navigation.navigateToPageClear(
      path: NavigationConstants.MENU_VIEW,
      data: school,
    );
  }
}
