import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? senderId;
  String? recieverId;
  Timestamp? created;
  String? text;
  String? time;

  MessageModel({this.created, this.recieverId, this.senderId, this.text, this.time});
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
        senderId: json['senderId'],
        recieverId: json['recieverId'],
        created:
            json['created'] != null ? Timestamp.fromMillisecondsSinceEpoch(json['created']) : null,
        text: json['text'],
        time: json['time']);
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'recieverId': recieverId,
      'created': created != null ? created!.millisecondsSinceEpoch : null,
      'text': text,
      'time': time
    };
  }
}
