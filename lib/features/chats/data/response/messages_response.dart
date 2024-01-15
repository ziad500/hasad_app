import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/model/message_model.dart';

class MessageResponse extends MessageModel {
  MessageResponse(
      {String? senderId, String? recieverId, Timestamp? created, String? text, String? time})
      : super(
          created: created,
          recieverId: recieverId,
          senderId: senderId,
          time: time,
          text: text,
        );

  factory MessageResponse.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return MessageResponse(
        created: documentSnapshot.get('created'),
        recieverId: documentSnapshot.get('recieverId'),
        text: documentSnapshot.get('text'),
        senderId: documentSnapshot.get('senderId'));
  }
  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(
      created: json['created'] ?? "",
      recieverId: json['recieverId'] ?? "",
      text: json['text'] ?? "",
      senderId: json["senderId"] ?? "",
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "created": created,
      "recieverId": recieverId,
      "text": text,
      "senderId": senderId,
    };
  }
}
