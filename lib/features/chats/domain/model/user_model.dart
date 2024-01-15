import 'package:cloud_firestore/cloud_firestore.dart';

class UserChatModel {
  String? userId;
  String? nameAr;
  String? title;
  Timestamp? created;
  String? time;
  String? nameEn;
  Timestamp? modified;
  String? image;
  String? lastMessage;
  bool? isRead;
  UserChatModel(
      {this.modified,
      this.created,
      this.title,
      this.nameAr,
      this.image,
      this.userId,
      this.lastMessage,
      this.nameEn,
      this.isRead,
      this.time});
  factory UserChatModel.fromJson(Map<String, dynamic> json) {
    return UserChatModel(
      userId: json['userId'] ?? "",
      nameAr: json['nameAr'] ?? "",
      title: json['title'] ?? "",
      time: json["time"] ?? "",
      created: json['created'],
      nameEn: json['nameEn'] ?? "",
      modified: json['modified'],
      image: json['image'] ?? "",
      lastMessage: json['lastMessage'] ?? "",
      isRead: json['isRead'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'nameAr': nameAr,
      'title': title,
      'created': created,
      'nameEn': nameEn,
      'modified': modified,
      'image': image,
      'lastMessage': lastMessage,
      'isRead': isRead,
      "time": time
    };
  }
}
