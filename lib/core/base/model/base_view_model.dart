import 'package:flutter/material.dart';

import '../../init/cache/locale_manager.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/ICoreDio.dart';
import '../../init/network/network_manager.dart';
import '../../init/network/vexana_manager.dart';

abstract class BaseViewModel {
  late BuildContext viewModelContext;

  ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;
  VexanaManager? vexanaManager = VexanaManager.instance;

  VexanaManager get vexanaManagerComputed => VexanaManager.instance;

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(viewModelContext).showSnackBar(snackBarError(message));
  }

  SnackBar snackBarError(String message) {
    return SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(vertical: 20),
    );
  }
}
