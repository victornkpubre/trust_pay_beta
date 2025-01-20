import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';

const String APPLICATION_JSON = "application/json";
const String MULTI_PART = "multipart/form-data";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);


  Future<Dio> getDio() async {
    Dio dio = Dio();
    int _timeout = 10;

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT:APPLICATION_JSON,
    };

    dio.options = BaseOptions (
      baseUrl: AppConstants.baseUrl,
      connectTimeout: Duration(minutes: _timeout),
      receiveTimeout: Duration(minutes: _timeout),
      headers: headers
    );

    dio.interceptors.add(AuthInterceptor(_appPreferences));

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: true,
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