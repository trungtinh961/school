import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/enums/locale_keys_enum.dart';
import '../../../core/constants/navigation/navigation_constants.dart';

part 'signin_view_model.g.dart';

class SignInViewModel = _SignInViewModel with _$SignInViewModel;

abstract class _SignInViewModel with Store, BaseViewModel {
  _SignInViewModel();

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}

  void goToSelectSchool() {
    localeManager.setStringValue(PreferencesKeys.USER_ROLE, 'teacher');
    navigation.navigateToPageReplace(path: NavigationConstants.SELECT_SCHOOL);
  }

  void goToForgotPassword(String? email) {
    navigation.navigateToPage(
        path: NavigationConstants.FORGOT_PASSWORD, data: email);
  }
}
