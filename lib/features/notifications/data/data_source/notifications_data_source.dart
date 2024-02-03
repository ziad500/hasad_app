import '../network/notifications_api.dart';
import '../network/requests.dart';
import '../responses/notifications_response.dart';

abstract class NotificationsRemoteDataSource {
  Future<NotificationsPaginationResponse> getNotifications(
      GetNotificationsRequest getNotificationsRequest);

  Future<dynamic> deleteNotifications(DeleteNotificationsRequest deleteNotificationsRequest);

  Future<dynamic> readNotifications();

  Future<HasUnReadNotificationsResponse> hasUnReadNotifications();

  Future<dynamic> deleteDeviceFcm(DeleteDeviceFcmRequest deleteDeviceFcmRequest);
}

class NotificationsRemoteDataSourceImpl implements NotificationsRemoteDataSource {
  final NotificationsAppServiceClient _appServiceClient;
  NotificationsRemoteDataSourceImpl(
    this._appServiceClient,
  );

  @override
  Future deleteDeviceFcm(DeleteDeviceFcmRequest deleteDeviceFcmRequest) =>
      _appServiceClient.deleteDeviceFcm(deleteDeviceFcmRequest.fcmId);

  @override
  Future deleteNotifications(DeleteNotificationsRequest deleteNotificationsRequest) =>
      _appServiceClient.deleteNotifications(deleteNotificationsRequest.notificationId);

  @override
  Future<NotificationsPaginationResponse> getNotifications(
          GetNotificationsRequest getNotificationsRequest) =>
      _appServiceClient.getNotifications(getNotificationsRequest.page);

  @override
  Future readNotifications() => _appServiceClient.readNotifications();

  @override
  Future<HasUnReadNotificationsResponse> hasUnReadNotifications() =>
      _appServiceClient.hasUnReadNotifications();
}
