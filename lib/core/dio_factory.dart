// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hasad_app/utils/cache_helper.dart';
import 'package:hasad_app/utils/cache_keys.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'constants.dart';
import 'dio_factory_functions.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "Content-Type";
const String ACCEPT = "Accept";
const String AUTHORIZATION = "Authorization";
const String ACCEPTLANGUAGE = "lang";

const String DEFAULT_LANGUAGE = "language";
Map<String, String> headers = {
  CONTENT_TYPE: APPLICATION_JSON,
  ACCEPT: APPLICATION_JSON,
};

class DioFactory {
//  final NetworkInfo _networkInfo;
//  DioFactory(this._networkInfo);
  Future<Dio> getDio() async {
    Dio dio = Dio();

    dio.interceptors.clear();
    dio.interceptors.add(QueuedInterceptorsWrapper(
        onRequest: (options, handler) => DioFactoryFunctions.onRequest(options, handler),
        onError: (DioException error, ErrorInterceptorHandler handler) =>
            DioFactoryFunctions.onError(error, handler)));
    dio.updateHeader();
    if (!kReleaseMode) {
      //depug mode
      dio.interceptors.add(PrettyDioLogger(
        error: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }

    return dio;
  }
}

extension DioHeader on Dio {
  void updateHeader() {
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: CacheHelper.getData(key: CacheKeys.token) == null
          ? ""
          : "Bearer ${CacheHelper.getData(key: CacheKeys.token)}",
    };

    options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: Constants.apiTimeOut,
      followRedirects: false,
    );
  }
}
