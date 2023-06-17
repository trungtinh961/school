import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';

part 'forgot_password_view_model.g.dart';

class ForgotPasswordViewModel = _ForgotPasswordViewModel with _$ForgotPasswordViewModel;

abstract class _ForgotPasswordViewModel with Store, BaseViewModel {
  _ForgotPasswordViewModel();

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}

  void goToSelectSchool() {
    navigation.navigateToPage(path: NavigationConstants.SELECT_SCHOOL);
  }

  void goToForgotPassword(String? email) {
    navigation.navigateToPage(path: NavigationConstants.FORGOT_PASSWORD);
  }
}
