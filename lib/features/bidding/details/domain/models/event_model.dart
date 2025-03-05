class EventModel {
  String channelName;
  String eventName;
  EventDataModel data;
  String? userId;

  EventModel({
    required this.channelName,
    required this.eventName,
    required this.data,
    this.userId,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      channelName: json['channelName'],
      eventName: json['eventName'],
      data: EventDataModel.fromJson(json['data']),
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'channelName': channelName,
      'eventName': eventName,
      'data': data.toJson(),
      'userId': userId,
    };
  }
}

class EventDataModel {
  num advertisementId;
  String userName;
  String userAvatar;
  String value;
  int numberOfBid;
  String createdAt;

  EventDataModel({
    required this.advertisementId,
    required this.userName,
    required this.userAvatar,
    required this.value,
    required this.numberOfBid,
    required this.createdAt,
  });

  factory EventDataModel.fromJson(Map<String, dynamic> json) {
    return EventDataModel(
      advertisementId: json['advertisement_id'],
      userName: json['user_name'],
      userAvatar: json['user_avatar'],
      value: json['value'],
      numberOfBid: json['number_of_bid'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'advertisement_id': advertisementId,
      'user_name': userName,
      'user_avatar': userAvatar,
      'value': value,
      'number_of_bid': numberOfBid,
      'created_at': createdAt,
    };
  }
}
