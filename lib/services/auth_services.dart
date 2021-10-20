import 'package:ProjectX/constants.dart';
import 'package:ProjectX/services/http_services.dart';
import 'package:ProjectX/utils/locator.dart';

abstract class AuthServices {
  Future<dynamic> doRegister(Map<String, dynamic> data);
  Future<dynamic> doLogin(Map<String, dynamic> data);
  Future<dynamic> doOTPVerification(Map<String, dynamic> data);
  Future<dynamic> doResendOTP(Map<String, dynamic> data);
}

class AuthServicesImpl implements AuthServices {
  final _httpServices = locator<HttpServices>();
  @override
  Future<dynamic> doRegister(Map<String, dynamic> data) async {
    return _httpServices.postHttp(kEndpointRegister, data: data);
  }

  @override
  Future doLogin(Map<String, dynamic> data) {
    return _httpServices.postHttp(kEndpointRegister, data: data);
  }

  @override
  Future doOTPVerification(Map<String, dynamic> data) {
    return _httpServices.postHttp(kEndpointRegister, data: data);
  }

  @override
  Future doResendOTP(Map<String, dynamic> data) {
    return _httpServices.putHttp(kEndpointRegister, data: data);
  }
}
