import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_school/view/create_school/model/school_model.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/enums/locale_keys_enum.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../create_school/service/create_school_service.dart';

part 'select_school_view_model.g.dart';

class SelectSchoolViewModel = _SelectSchoolViewModel
    with _$SelectSchoolViewModel;

abstract class _SelectSchoolViewModel with Store, BaseViewModel {
  _SelectSchoolViewModel(this._createSchoolService);

  final CreateSchoolService _createSchoolService;
  @observable
  List<SchoolModel> schoolList = [];

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _getListSchool();
  }

  void _getListSchool() {
    _createSchoolService.getListSchool().then((value) {
      schoolList = value;
    });
  }

  void onSelectSchool(SchoolModel? item) {
    localeManager.setStringValue(PreferencesKeys.SCHOOL_ID, item?.id ?? '');
    navigation.navigateToPageClear(path: NavigationConstants.MENU_VIEW, data: item);
  }
}
