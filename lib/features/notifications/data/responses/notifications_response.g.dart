// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsPaginationResponse _$NotificationsPaginationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationsPaginationResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      pagination: json['pagination'] == null
          ? null
          : PaginationResponse.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationsPaginationResponseToJson(
        NotificationsPaginationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'pagination': instance.pagination,
      'data': instance.data,
    };

NotificationsResponse _$NotificationsResponseFromJson(Map<String, dynamic> json) =>
    NotificationsResponse(
      id: json['id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      isRead: json['is_read'] as bool?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$NotificationsResponseToJson(NotificationsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'is_read': instance.isRead,
      'created_at': instance.createdAt,
    };

HasUnReadNotificationsResponse _$HasUnReadNotificationsResponseFromJson(
        Map<String, dynamic> json) =>
    HasUnReadNotificationsResponse(
      count: json['count'] as int?,
      hasUnreadNotifications: json['hasUnreadNotifications'] as bool?,
    );

Map<String, dynamic> _$HasUnReadNotificationsResponseToJson(
        HasUnReadNotificationsResponse instance) =>
    <String, dynamic>{
      'hasUnreadNotifications': instance.hasUnreadNotifications,
      'count': instance.count,
    };
