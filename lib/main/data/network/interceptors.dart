import 'package:dio/dio.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';

import 'dio_factory.dart';


class AuthInterceptor extends InterceptorsWrapper {
  final AppPreferences _appPreferences;
  AuthInterceptor(this._appPreferences);

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Automatically set the correct Content-Type
    if (options.data is FormData) {
      options.headers['Content-Type'] = 'multipart/form-data';
    } else if (options.data is Map<String, dynamic>) {
      options.headers['Content-Type'] = 'application/json';
    }

    //Apply access token if available
    String? token = await _appPreferences.getAccessToken() ;
    var headers = {AUTHORIZATION: "Bearer ${token??AppConstants.token}"};
    options.headers.addAll(headers);
    return super.onRequest(options, handler);
  }

}

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final Duration retryDelay;

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 2),
  });

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err) && err.requestOptions.extra['retryCount'] < maxRetries) {
      err.requestOptions.extra['retryCount'] =
          (err.requestOptions.extra['retryCount'] ?? 0) + 1;

      print("Retrying request... Attempt ${err.requestOptions.extra['retryCount']}");

      await Future.delayed(retryDelay);
      try {
        final response = await dio.fetch(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        return handler.reject(err);
      }
    }
    return handler.reject(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.response?.statusCode == 500;
  }
}
