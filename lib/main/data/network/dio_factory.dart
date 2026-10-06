import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/data/network/interceptors.dart';

const String APPLICATION_JSON = "application/json";
const String MULTI_PART = "multipart/form-data";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String TRUE = "true";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";
const String ZROK_SKIP_INIT = "skip_zrok_interstitial";

class DioFactory {
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);


  Future<Dio> getDio() async {
    Dio dio = Dio();
    int _timeout = 10;

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT:APPLICATION_JSON,
      ZROK_SKIP_INIT : TRUE
    };
    dio.options = BaseOptions (
      baseUrl: AppConstants.baseUrl,
      connectTimeout: Duration(minutes: _timeout),
      receiveTimeout: Duration(minutes: _timeout),
      headers: headers
    );

    dio.interceptors.add(AuthInterceptor(_appPreferences));

    // dio.interceptors.add(RetryInterceptor(dio: dio, maxRetries: 5, retryDelay: const Duration(seconds: 2)));

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        // Debug only — formatting large JSON bodies on every request is
        // expensive, and release builds shouldn't log traffic at all.
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if(options.path.contains('/posts')){
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }
    ));

    return dio;
  }

}
