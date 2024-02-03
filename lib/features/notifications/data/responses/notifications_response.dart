// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/responses/pagination_response.dart';

part 'notifications_response.g.dart';

@JsonSerializable()
class NotificationsPaginationResponse {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "pagination")
  PaginationResponse? pagination;
  @JsonKey(name: "data")
  List<NotificationsResponse>? data;
  NotificationsPaginationResponse({
    this.status,
    this.message,
    this.pagination,
    this.data,
  });

  //from json
  factory NotificationsPaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsPaginationResponseFromJson(json);
//to json
  Map<String, dynamic> toJson() => _$NotificationsPaginationResponseToJson(this);
}

@JsonSerializable()
class NotificationsResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "body")
  String? body;
  @JsonKey(name: "is_read")
  bool? isRead;
  @JsonKey(name: "created_at")
  String? createdAt;
  NotificationsResponse({
    this.id,
    this.title,
    this.body,
    this.isRead,
    this.createdAt,
  });

  //from json
  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);
//to json
  Map<String, dynamic> toJson() => _$NotificationsResponseToJson(this);
}

@JsonSerializable()
class HasUnReadNotificationsResponse {
  @JsonKey(name: "hasUnreadNotifications")
  bool? hasUnreadNotifications;
  @JsonKey(name: "count")
  int? count;

  HasUnReadNotificationsResponse({this.count, this.hasUnreadNotifications});

  //from json
  factory HasUnReadNotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$HasUnReadNotificationsResponseFromJson(json);
//to json
  Map<String, dynamic> toJson() => _$HasUnReadNotificationsResponseToJson(this);
}
