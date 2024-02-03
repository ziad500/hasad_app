import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/failure.dart';
import '../data_source/notifications_data_source.dart';
import '../mapper/notifications_mapper.dart';
import '../network/requests.dart';
import '../../domain/models/has_un_read_notifications_model.dart';
import '../../domain/models/notifications_model.dart';
import '../../domain/repository/notifications_repo.dart';

import '../../../../core/error_handler.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDataSource _notificationsRemoteDataSource;

  NotificationsRepositoryImpl(
    this._notificationsRemoteDataSource,
  );

  @override
  Future<Either<Failure, dynamic>> deleteDeviceFcm(
      DeleteDeviceFcmRequest deleteDeviceFcmRequest) async {
    try {
      final response = await _notificationsRemoteDataSource.deleteDeviceFcm(deleteDeviceFcmRequest);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteNotifications(
      DeleteNotificationsRequest deleteNotificationsRequest) async {
    try {
      final response =
          await _notificationsRemoteDataSource.deleteNotifications(deleteNotificationsRequest);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, NotificationsPaginationModel>> getNotifications(
      GetNotificationsRequest getNotificationsRequest) async {
    try {
      final response =
          await _notificationsRemoteDataSource.getNotifications(getNotificationsRequest);
      return right(response.toDomain());
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, HasUnReadNotificationsModel>> hasUnReadNotifications() async {
    try {
      final response = await _notificationsRemoteDataSource.hasUnReadNotifications();
      return right(response.toDomain());
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, dynamic>> readNotifications() async {
    try {
      final response = await _notificationsRemoteDataSource.readNotifications();
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }
}
