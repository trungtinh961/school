import 'package:kartal/kartal.dart';

import '../../../core/init/cache/locale_manager.dart';

mixin DeviceAndCache {
  Future<void> deviceAndCacheInit() async {
    await Future.wait([
      LocaleManager.prefrencesInit(),
      DeviceUtility.instance.initPackageInfo(),
    ]);
  }
}
