class SetDeviceFcmRequest {
  String registrationId;
  String type;
  SetDeviceFcmRequest(this.registrationId, this.type);
}

class DeleteDeviceFcmRequest {
  int fcmId;
  DeleteDeviceFcmRequest(this.fcmId);
}

class ReadNotificationsRequest {
  String notificationId;
  ReadNotificationsRequest(this.notificationId);
}

class DeleteNotificationsRequest {
  String notificationId;
  DeleteNotificationsRequest(this.notificationId);
}

class GetNotificationsRequest {
  String page;
  GetNotificationsRequest(this.page);
}
