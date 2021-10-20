import 'dart:io';

import 'package:ProjectX/utils/log_printer.dart';
import 'package:device_info/device_info.dart';

abstract class HardwareInfoService {
  String get operatingSystem;
  String get device;
  String get udid;

  Future<void> init();
}

class HardwareInfoServiceImpl implements HardwareInfoService {
  final _log = getLogger('hardare_info_service.dart');

  late String _operatingSystem;
  late String _device;
  late String _udid;

  @override
  String get operatingSystem => _operatingSystem;

  @override
  String get device => _device;

  @override
  String get udid => _udid;

  @override
  Future<void> init() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      _udid = iosInfo.identifierForVendor;
      _operatingSystem = 'iOS';
      _device = iosInfo.utsname.machine;
    } else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      _udid = androidInfo.androidId;
      _operatingSystem = 'Android';
      _device = androidInfo.model;
    }

    _log.w('udid: $_udid');
    _log.w('operating_system: $_operatingSystem');
    _log.w('device: $_device');
  }
}
