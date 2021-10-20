import 'package:get_it/get_it.dart';
import 'package:ProjectX/services/auth_services.dart';
import 'package:ProjectX/services/hardware_info_service.dart';
import 'package:ProjectX/services/http_services.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<AuthServices>(() => AuthServicesImpl());
  locator.registerFactory<HttpServices>(() => HttpServicesImpl());
  locator.registerLazySingleton<HardwareInfoService>(
    () => HardwareInfoServiceImpl(),
  );
  // @todo: implement log_service
}
