// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

// Function to handle response errors
Failure hangdleResponseError(DioException error) {
  if (error.type == DioExceptionType.connectionTimeout) {
    return Failure(500, LocaleKeys.internal_server_error.tr());
  } else if (error.response?.statusCode == 500) {
    return Failure(500, LocaleKeys.internal_server_error.tr());
  }
  if (error.response?.data is Map<String, dynamic>) {
    Map<String, dynamic> errors = error.response!.data;
    if (errors.values.elementAt(0) is String) {
      return Failure(error.response?.statusCode ?? 400, errors.values.elementAt(0));
    }
    if (errors.values.elementAt(1) is String) {
      return Failure(error.response?.statusCode ?? 400, errors.values.elementAt(1));
    } else if (errors.values.first is String) {
      return Failure(error.response?.statusCode ?? 400, errors.values.first);
    } else if (errors.values.first[1] is String) {
      return Failure(error.response?.statusCode ?? 400, errors.values.first[1]);
    } else if (errors.values.first == null && errors.values.first[1] == null) {
      return ErrorHandler.handle(error).failure;
    }
  } else if (error.response?.data is List) {
    List errors = error.response!.data;
    return Failure(error.response?.statusCode ?? 400, errors[1]);
  } else {
    return ErrorHandler.handle(error).failure;
  }
  return ErrorHandler.handle(error).failure;
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();

    case DioExceptionType.connectionError:
      return DataSource.CONNECT_TIMEOUT.getFailure();

    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIME_OUT.getFailure();

    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();

    case DioExceptionType.badCertificate:
      if (error.response != null &&
          error.response?.statusMessage != null &&
          error.response?.statusCode != null) {
        return Failure(error.response?.statusCode ?? 0, error.response?.statusMessage ?? "");
      } else {
        return DataSource.DEFAULT.getFailure();
      }

    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusMessage != null &&
          error.response?.statusCode != null) {
        return Failure(error.response?.statusCode ?? 0, error.response?.statusMessage ?? "");
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();

    case DioExceptionType.unknown:
      return DataSource.DEFAULT.getFailure();

    default:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIME_OUT,
  CASHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS.tr());

      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT.tr());

      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST.tr());

      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN.tr());

      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED.tr());

      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND.tr());

      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(
            ResponseCode.INTERNAL_SERVER_ERROR, ResponseMessage.INTERNAL_SERVER_ERROR.tr());

      case DataSource.CONNECT_TIMEOUT:
        return Failure(ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT.tr());

      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL.tr());

      case DataSource.RECIEVE_TIMEOUT:
        return Failure(ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT.tr());

      case DataSource.SEND_TIME_OUT:
        return Failure(ResponseCode.SEND_TIME_OUT, ResponseMessage.SEND_TIMEOUT.tr());

      case DataSource.CASHE_ERROR:
        return Failure(ResponseCode.CASHE_ERROR, ResponseMessage.CACHE_ERROR.tr());

      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(
            ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage.NO_INTERNET_CONNECTION.tr());
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT.tr());
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTHORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; // failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, Not Found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIME_OUT = -4;
  static const int CASHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int UNKNOWN = -7;
  static const int DEFAULT = -8;
}

class ResponseMessage {
  static const String SUCCESS = LocaleKeys.success; // success with data
  static const String NO_CONTENT = LocaleKeys.success; // success with no data
  static const String BAD_REQUEST = LocaleKeys.bad_request_error; // failure, API rejected request
  static const String UNAUTHORISED =
      LocaleKeys.unauthorized_error; // failure, user is not authorised
  static const String FORBIDDEN = LocaleKeys.forbidden_error; // failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      LocaleKeys.internal_server_error; // failure, crash in server side
  static const String NOT_FOUND = LocaleKeys.not_found_error; // failure, Not Found

  // local status code
  static const String CONNECT_TIMEOUT = LocaleKeys.timeout_error;
  static const String CANCEL = LocaleKeys.default_error;
  static const String RECIEVE_TIMEOUT = LocaleKeys.timeout_error;
  static const String SEND_TIMEOUT = LocaleKeys.timeout_error;
  static const String CACHE_ERROR = LocaleKeys.cache_error;
  static const String NO_INTERNET_CONNECTION = LocaleKeys.no_internet_error;
  static const String DEFAULT = LocaleKeys.default_error;
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
