import 'package:hasad_app/core/responses/pagination_response.dart';

import '../responses/notifications_response.dart';
import '../../domain/models/has_un_read_notifications_model.dart';
import '../../domain/models/notifications_model.dart';

extension HasUnReadNotificationsResponseMapper on HasUnReadNotificationsResponse? {
  HasUnReadNotificationsModel toDomain() {
    return HasUnReadNotificationsModel(this?.count, this?.hasUnreadNotifications);
  }
}

extension NotificationsResponseMapper on NotificationsResponse? {
  NotificationsModel toDomain() {
    return NotificationsModel(this?.id, this?.title, this?.body, this?.isRead, this?.createdAt);
  }
}

extension NotificationsPaginationResponseMapper on NotificationsPaginationResponse? {
  NotificationsPaginationModel toDomain() {
    return NotificationsPaginationModel(this?.status, this?.message, this?.pagination.toDomain(),
        this?.data?.map((e) => e.toDomain()).toList());
  }
}
