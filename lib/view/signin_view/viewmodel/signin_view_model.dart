import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/enums/locale_keys_enum.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../create_school/model/school_model.dart';
import '../../create_school/service/create_school_service.dart';

part 'signin_view_model.g.dart';

class SignInViewModel = _SignInViewModel with _$SignInViewModel;

abstract class _SignInViewModel with Store, BaseViewModel {
  _SignInViewModel(this._createSchoolService);

  final CreateSchoolService _createSchoolService;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}

  void onSignInSuccess(String? email) {
    if (email == null) {
      return;
    }
    _createSchoolService.getSchoolByEmail(email).then(
      (school) {
        localeManager.setStringValue(PreferencesKeys.USER_ROLE, 'teacher');
        if (school == null) {
          _goToCreateSchool();
        } else {
          _goToMenu(school);
        }
      },
    );
  }

  void _goToCreateSchool() {
    navigation.navigateToPage(path: NavigationConstants.CREATE_SCHOOL);
  }

  void _goToMenu(SchoolModel? item) {
    localeManager.setStringValue(PreferencesKeys.SCHOOL_ID, item?.id ?? '');
    navigation.navigateToPageClear(
        path: NavigationConstants.MENU_VIEW, data: item);
  }

  void goToForgotPassword(String? email) {
    navigation.navigateToPage(
        path: NavigationConstants.FORGOT_PASSWORD, data: email);
  }
}
