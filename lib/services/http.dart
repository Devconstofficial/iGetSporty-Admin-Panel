import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:iget_sporty_admin_panel/services/urls.dart';

typedef CancelRequestCallBack = void Function(http.Client client);

class HttpServiceManager {
  static final http.Client _client = http.Client();

  static Future<Map<String, String>> get _headers async {
    return <String, String>{'Content-Type': 'application/json; charset=UTF-8'};
  }

  static Future<http.Response> post({
    required String endPoint,
    Object? body,
    Encoding? encoding,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    CancelRequestCallBack? cancelRequestCallBack,
  }) async {
    Uri uri = Uri.parse(Url.base + endPoint);
    log('API:: $uri');
    if (queryParameters != null) {
      uri = uri.replace(queryParameters: queryParameters);
    }
    cancelRequestCallBack?.call(_client);
    return _client.post(uri,
        body: jsonEncode(body),
        encoding: encoding,
        headers: headers ?? await _headers);
  }

  static Future<http.Response> get({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    Uri uri = Uri.parse(Url.base + endPoint);
    log('API:: $uri');
    if (queryParameters != null) {
      uri = uri.replace(queryParameters: queryParameters);
    }
    return http.get(uri, headers: headers ?? await _headers);
  }

  static Future<http.Response> patch({
    required String endPoint,
    Object? body,
    Encoding? encoding,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    Uri uri = Uri.parse(Url.base + endPoint);
    log('API:: $uri');
    if (queryParameters != null) {
      uri = uri.replace(queryParameters: queryParameters);
    }
    return _client.patch(
      uri,
      body: jsonEncode(body),
      encoding: encoding,
      headers: headers ?? await _headers,
    );
  }

  static Future<http.Response> put({
    required String endPoint,
    Object? body,
    Encoding? encoding,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    Uri uri = Uri.parse(Url.base + endPoint);
    log('API:: $uri');
    if (queryParameters != null) {
      uri = uri.replace(queryParameters: queryParameters);
    }
    return _client.put(
      uri,
      body: jsonEncode(body),
      encoding: encoding,
      headers: headers ?? await _headers,
    );
  }

  static Future<http.Response> delete({
    required String endPoint,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    Uri uri = Uri.parse(Url.base + endPoint);
    log('API:: $uri');
    if (queryParameters != null) {
      uri = uri.replace(queryParameters: queryParameters);
    }
    return _client.delete(
      uri,
      headers: headers ?? await _headers,
    );
  }
}
