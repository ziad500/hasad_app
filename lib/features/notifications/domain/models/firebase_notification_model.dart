import 'dart:convert';

class FirebaseNotificationModel {
  String notificationType;
  String notificationTypeId;
  String body;

  FirebaseNotificationModel(this.notificationType, this.notificationTypeId, this.body);

  factory FirebaseNotificationModel.fromJson(Map<String, dynamic> json) {
    return FirebaseNotificationModel(json['content_type'] as String,
        json['notification_type_id'] as String, json['name_ar'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'content_type': notificationType,
      'notification_type_id': notificationTypeId,
      'name_ar': body
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
