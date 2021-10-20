import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ProjectX/models/model_http_error.dart';
import 'package:ProjectX/utils/log_printer.dart';

abstract class HttpServices {
  Future<dynamic> getHttp(String route);
  Future<dynamic> postHttp(String route, {Map<String, dynamic>? data});
  Future<dynamic> putHttp(String route, {Map<String, dynamic>? data});
  void dispose();
}

class HttpServicesImpl extends HttpServices {
  final _log = getLogger('http_service.dart');
  final _dio = Dio();
  final Options _options = Options(
    headers: {'Content-Type': 'application/json', 'x-platform-type': 'web'},
  );

  @override
  Future<dynamic> getHttp(String route) async {
    _log.w('>>>>>>>>>>>>> GET: $route');

    try {
      return await _dio
          .get(
            route,
            options: _options,
          )
          .then(_returnResponse);
    } on DioError catch (error) {
      throw Exception(error.response);
    }
  }

  @override
  Future<dynamic> postHttp(String route, {Map<String, dynamic>? data}) async {
    _log.w('>>>>>>>>>>>>> POST" $route');
    _log.w('>>>>>>>>>>>>> Data: ${jsonEncode(data)}');

    try {
      return await _dio
          .post(
            route,
            data: jsonEncode(data),
            options: _options,
          )
          .then(_returnResponse);
    } on DioError catch (error) {
      _log.e('==== DioError FAILED ====');
      // _log.e('>>>>>>>>>>>>> ${error.requestOptions.headers}');
      _log.e('>>>>>>>>>>>>> ${error.response}');
      _log.e('>>>>>>>>>>>>> ${error.message}');

      final res = ModelHttpError.fromJson(error.response?.data);
      if (res.errors is List<dynamic>) {
        throw Exception(res.errors!.first);
      }
      // _log.e('>>>>>>>>>>>>> body ${error.response}');
      throw Exception(res.message ?? 'Unable to complete action');
    }
  }

  @override
  Future putHttp(String route, {Map<String, dynamic>? data}) async {
    _log.w('>>>>>>>>>>>>> PUT" $route');
    _log.w('>>>>>>>>>>>>> Data: ${jsonEncode(data)}');
    try {
      return await _dio
          .put(
            route,
            data: jsonEncode(data),
            options: _options,
          )
          .then(_returnResponse);
    } on DioError catch (error) {
      _log.e('==== DioError FAILED ====');
      _log.e('>>>>>>>>>>>>> ${error.response}');
      _log.e('>>>>>>>>>>>>> ${error.message}');

      final res = ModelHttpError.fromJson(error.response?.data);
      if (res.errors is List<dynamic>) {
        throw Exception(res.errors!.first);
      }
      throw Exception(res.message ?? 'Unable to complete action');
    }
  }

  dynamic _returnResponse(Response response) {
    final dynamic res = response.data;
    final int statusCode = response.statusCode ?? 500;

    if (statusCode < 200 || statusCode > 400) {
      _log.e('==== FAILED ====');
      _log.e('>>>>>>>>>>>>> body $res');
      throw new Exception('Error during request');
    }

    _log.i('==== SUCCESS ====');
    _log.i('>>>>>>>>>>>>> response: $res');
    return res;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

// Map<String, String> baseHeaders = {
//   'Content-Type': 'application/json',
//   'x-platform-type': 'web'
// };

// class HttpService {
//   static SharedPreferences? _sharedPreferences;

//   static String _url(String route) {
//     return route.contains('://')
//         ? route
//         : '${EnvironmentConfiguration.BASE_API_URL}$route';
//   }

//   static Future<http.Response> delete(String route,
//       [dynamic body, bool addAuthToken = true]) async {
//     final url = _url(route);
//     LogService.debug('DELETE $url');

//     final headers = await _getHeaders(addAuthToken);
//     final request = http.Request('DELETE', Uri.parse(url));
//     request.headers.addAll(headers);

//     if (body != null) {
//       request.body = json.encode(body);
//     }

//     final response =
//         await http.Client().send(request).then(http.Response.fromStream);

//     LogService.debug('DELETE ${response.statusCode}');

//     return response;
//   }

//   static Future<http.Response> get(String route,
//       [bool addAuthToken = true]) async {
//     final url = _url(route);
//     LogService.debug('GET $url');

//     final headers = await _getHeaders(addAuthToken);
//     final response = await http.get(Uri.parse(url), headers: headers);

//     LogService.debug('GET ${response.statusCode}');

//     return response;
//   }

//   static Future<http.Response> post(String route,
//       {dynamic body, bool addAuthToken = true}) async {
//     final url = _url(route);
//     LogService.debug('POST $url');

//     final headers = await _getHeaders(addAuthToken);
//     final response = await http.post(Uri.parse(url),
//         headers: headers, body: jsonEncode(body));

//     LogService.debug('POST ${response.statusCode}');

//     return response;
//   }

//   static Future<http.Response> put(String route,
//       [dynamic body, bool addAuthToken = true]) async {
//     final url = _url(route);
//     LogService.debug('PUT $url');

//     final headers = await _getHeaders(addAuthToken);
//     print("body $body");
//     final response = await http.put(Uri.parse(url),
//         headers: headers, body: jsonEncode(body));

//     LogService.debug('PUT ${response.body}');

//     return response;
//   }

//   static Future<Map<String, String>> _getHeaders(bool addAuthToken) async {
//     var headers = {...baseHeaders};

//     if (addAuthToken) {
//       if (_sharedPreferences == null) {
//         _sharedPreferences = await SharedPreferences.getInstance();
//       }

//       final token = _sharedPreferences?.getString("SharedPreferenceKeys.TOKEN");
//       //LogService.debug("token $token");
//       if (token?.isEmpty ?? true) {
//         throw UnauthorizedException('Invalid token');
//       }

//       headers = {...headers, HttpHeaders.authorizationHeader: 'Bearer $token'};
//     }
//     // LogService.debug("headers $headers");

//     return headers;
//   }

//   static dynamic parseResponse(http.Response response) {
//     Map<String, dynamic> responseBody = {};

//     try {
//       responseBody = json.decode(response.body);
//     } catch (ex) {
//       LogService.error('HttpService parseResponse: $ex');
//     }

//     switch (response.statusCode) {
//       case 200:
//         return responseBody['result'];
//       case 401:
//         return Future.error(UnauthorizedException(responseBody['error']));
//       case 404:
//         return Future.error(NotFoundException(responseBody['error']));
//       default:
//         return Future.error(BadRequestException(
//             responseBody['error'] ?? response.reasonPhrase));
//     }
//   }
// }
