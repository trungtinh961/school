import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';
import 'package:smart_school/view/create_school/model/province_model.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/enums/locale_keys_enum.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../create_school/service/create_school_service.dart';
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
    localeManager.setStringValue(PreferencesKeys.USER_ROLE, 'teacher');
    _goToCreateSchool();
  }

  void onClickStudent() {
    localeManager.setStringValue(PreferencesKeys.USER_ROLE, 'student');
    _goToMenu();
  }

  void _goToMenu() {
    navigation.navigateToPageClear(path: NavigationConstants.MENU_VIEW);
  }

  void _goToCreateSchool() {
    navigation.navigateToPage(path: NavigationConstants.CREATE_SCHOOL);
  }
}
