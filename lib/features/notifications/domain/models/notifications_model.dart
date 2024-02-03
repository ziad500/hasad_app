import 'package:hasad_app/core/responses/pagination_response.dart';

class NotificationsPaginationModel {
  bool? status;
  String? message;
  PaginationModel? pagination;
  List<NotificationsModel>? data;
  NotificationsPaginationModel(
    this.status,
    this.message,
    this.pagination,
    this.data,
  );
}

class NotificationsModel {
  String? id;
  String? title;
  String? body;
  bool? isRead;
  String? createdAt;
  NotificationsModel(
    this.id,
    this.title,
    this.body,
    this.isRead,
    this.createdAt,
  );
}
