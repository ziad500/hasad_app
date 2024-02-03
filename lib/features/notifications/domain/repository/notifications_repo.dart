import 'package:dartz/dartz.dart';
import '../../../../core/failure.dart';
import '../../data/network/requests.dart';
import '../models/has_un_read_notifications_model.dart';
import '../models/notifications_model.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, NotificationsPaginationModel>> getNotifications(
      GetNotificationsRequest getNotificationsRequest);

  Future<Either<Failure, dynamic>> deleteNotifications(
      DeleteNotificationsRequest deleteNotificationsRequest);

  Future<Either<Failure, dynamic>> readNotifications();

  Future<Either<Failure, HasUnReadNotificationsModel>> hasUnReadNotifications();

  Future<Either<Failure, dynamic>> deleteDeviceFcm(DeleteDeviceFcmRequest deleteDeviceFcmRequest);
}
