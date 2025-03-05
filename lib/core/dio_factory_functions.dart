import 'dart:convert';

import 'package:hasad_app/features/auth/data/network/auth_requests.dart';
import 'package:hasad_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';

import '../common/default/show_toast.dart';
import '../utils/cache_helper.dart';
import '../utils/cache_keys.dart';
import '../main.dart';
import 'package:dio/dio.dart';

import 'constants.dart';
import 'dio_factory.dart';

class DioFactoryFunctions {
  static void onError(DioException error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401 && Constants.token != "") {
      LoginCubit.get(navigatorKey.currentContext).userLogOut(LogOutRequest());
      Constants.token = "";
      showSnackbar(
          context: navigatorKey.currentContext,
          text: Constants.isArabic ? "من فضلك قم بتسجيل الدخول من جديد" : "please login again",
          state: ToastStates.ERROR);
      /*  Dio dio = Dio();
      try {
        final value = await dio.post('${Constants.baseUrl}auth/refreshToken',
            data: jsonEncode({"refreshToken": Constants.refreshToken}),
            options: Options(
              followRedirects: false,
              headers: headers,
              receiveDataWhenStatusError: true,
            ));
        CacheHelper.saveData(key: CacheKeys.token, value: value.data['token']);
        Constants.token = value.data['token'];
        final options = error.response!.requestOptions;
        options.headers[AUTHORIZATION] = 'Bearer ${Constants.token}';
        final response = await dio.request(
          "${Constants.baseUrl}${options.path}",
          data: options.data,
          queryParameters: options.queryParameters,
          options: Options(
              method: options.method,
              headers: options.headers,
              responseType: options.responseType,
              receiveDataWhenStatusError: options.receiveDataWhenStatusError,
              followRedirects: options.followRedirects,
              extra: options.extra,
              validateStatus: options.validateStatus),
        );
        return handler.resolve(response);
      } catch (e) {
        if (e is DioException) {
          if (e.response?.statusCode == 401) {
            showSnackbar(
                context: navigatorKey.currentContext,
                text: "please login again",
                state: ToastStates.ERROR);
            /*    navigatorKey.currentState?.pushNamedAndRemoveUntil(
                  Routes.loginRoutes, (route) => false,
                  arguments: {"back": false}); */
            handler.next(error);
          } else {
            handler.next(error);
          }
        } else {
          handler.next(error);
        }
      } */
    } else {
      handler.next(error);
    }
  }

  static void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
    /*  NetworkInfo networkInfo */
  ) async {
    String? token = await getLatestToken(); // Get the latest token
/*     if (!isNetworkConnected) {
      if (await networkInfo.isConnected) {
        networkOnlineDialog();
      }
    } */
    options.headers[AUTHORIZATION] = token == null ? "" : "Bearer $token";
    options.headers[ACCEPTLANGUAGE] = Constants.isArabic ? "ar" : "en";
    return handler.next(options);
  }

  static Future<String?> getLatestToken() async {
    // Get the latest token from cache or wherever you store it
    return CacheHelper.getData(key: CacheKeys.token);
  }
}
