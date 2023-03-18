import 'package:vexana/vexana.dart';

import '../model/force_update_model.dart';

abstract class ISplashService {
  ISplashService(this.networkManager);
  final INetworkManager networkManager;

  Future<ForceUpdateModel?> checkDeviceVersion({
    required String version,
    required String platform,
  });
}

enum SplashServiceQuery { VERSION, PLATFORM }

extension SplashServiceQueryExtension on SplashServiceQuery {
  MapEntry<String, String> toMapValue(String value) {
    switch (this) {
      case SplashServiceQuery.PLATFORM:
        return MapEntry('platform', value);
      case SplashServiceQuery.VERSION:
        return MapEntry('version', value);
    }
  }
}

class SplashService extends ISplashService {
  SplashService(INetworkManager networkManager) : super(networkManager);
  final String _path = 'version';

  @override
  Future<ForceUpdateModel?> checkDeviceVersion({
    required String version,
    required String platform,
  }) async {
    final response = await networkManager.send<ForceUpdateModel, ForceUpdateModel>(
      _path,
      parseModel: ForceUpdateModel(),
      method: RequestType.GET,
      queryParameters: Map.fromEntries(
        [
          SplashServiceQuery.VERSION.toMapValue(version),
          SplashServiceQuery.PLATFORM.toMapValue(platform),
        ],
      ),
    );
    return response.data;
  }
}
