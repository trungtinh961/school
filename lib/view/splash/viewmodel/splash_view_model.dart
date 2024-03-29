import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/enums/locale_keys_enum.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../service/splash_service.dart';
import 'device_and_cahe.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel, DeviceAndCache {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  bool isFirstInit = true;

  ISplashService? service;

  @override
  void init() {
    startAnimationOnView();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controlAppState();
    });
    FirebaseAuth.instance.signOut();
  }

  Future<void> controlAppState() async {
    await deviceAndCacheInit();
    _networkInit();
  }

  void _networkInit() {
    if (vexanaManager != null) {
      service = SplashService(vexanaManagerComputed.networkManager);
    }
  }

  Future<void> startAnimationOnView() async {
    await Future.delayed(viewModelContext.durationLow);
    _changeFirstInit();
  }

  @action
  void _changeFirstInit() {
    isFirstInit = !isFirstInit;
  }

  void onClickTeacher() {
    _goToSignin();
  }

  void onClickStudent() {
    localeManager.setStringValue(PreferencesKeys.USER_ROLE, 'student');
    _goToSelectSchool();
  }

  void _goToSelectSchool() {
    navigation.navigateToPage(path: NavigationConstants.SELECT_SCHOOL);
  }

  void _goToSignin() {
    navigation.navigateToPage(path: NavigationConstants.SIGN_IN);
  }
}
