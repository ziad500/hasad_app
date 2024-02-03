import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import '../responses/notifications_response.dart';

import '../../../../core/constants.dart';
part 'notifications_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class NotificationsAppServiceClient {
  factory NotificationsAppServiceClient(Dio dio, {String baseUrl}) = _NotificationsAppServiceClient;

  @GET("notifications")
  Future<NotificationsPaginationResponse> getNotifications(@Query("page") String page);

  @POST("notifications/delete")
  Future<dynamic> deleteNotifications(@Part(name: "notification_id") String notificationId);

  @GET("notifications/read-all")
  Future<dynamic> readNotifications();

  @GET("api/v1/notifications/has_unread_notifications")
  Future<HasUnReadNotificationsResponse> hasUnReadNotifications();

  @DELETE("api/v1/fcm/{id}")
  Future<dynamic> deleteDeviceFcm(@Path("id") int id);
}
