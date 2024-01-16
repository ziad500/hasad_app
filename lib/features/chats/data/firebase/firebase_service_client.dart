import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hasad_app/features/chats/data/firebase/requests.dart';
import '../../../../core/constants.dart';
import '../response/user_reponse.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

abstract class FirebaseServiceClient {
  Future<dynamic> updateUser(UserChatsResponse userModel);
  Future<dynamic> makeMessageRead(MakeMessageReadRequest makeMessageReadRequest);

  //send Message
  Future<dynamic> addChat(SendMessageRequest sendMessageRequest);
  Future<dynamic> saveMessage(SendMessageRequest sendMessageRequest);

  Future<dynamic>? uploadFile(String path);
}

class FirebaseServiceClientImpl implements FirebaseServiceClient {
  final FirebaseFirestore firestore;

  FirebaseServiceClientImpl(this.firestore);

  @override
  Future saveMessage(SendMessageRequest sendMessageRequest) {
    final usersCollectionRef = firestore.collection("users");
    final chatsSenderCollectionRef =
        usersCollectionRef.doc(sendMessageRequest.userId).collection("chats");
    final messagesSenderCollectionRef = chatsSenderCollectionRef
        .doc(sendMessageRequest.recieverModel.userId)
        .collection("messages");
    return messagesSenderCollectionRef.add(sendMessageRequest.messageModel.toDocument());
  }

  @override
  Future addChat(SendMessageRequest sendMessageRequest) async {
    final usersCollectionRef = firestore.collection("users");
    final chatsSenderCollectionRef =
        usersCollectionRef.doc(sendMessageRequest.userId).collection("chats");

    // set his profile in my chats list
    try {
      final value =
          await chatsSenderCollectionRef.doc(sendMessageRequest.messageModel.recieverId).get();
      if (!value.exists) {
        return chatsSenderCollectionRef
            .doc(sendMessageRequest.messageModel.recieverId)
            .set(sendMessageRequest.recieverModel.toDocument());
      } else {
        return chatsSenderCollectionRef.doc(sendMessageRequest.messageModel.recieverId).set(
            UserChatsResponse(
                    isRead: sendMessageRequest.recieverModel.isRead,
                    created: UserChatsResponse.fromSnapshot(value).created,
                    image: sendMessageRequest.recieverModel.image,
                    nameAr: sendMessageRequest.recieverModel.nameAr,
                    nameEn: sendMessageRequest.recieverModel.nameEn,
                    userId: UserChatsResponse.fromSnapshot(value).userId,
                    lastMessage: sendMessageRequest.messageModel.text,
                    modified: sendMessageRequest.recieverModel.modified)
                .toDocument());
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<dynamic> updateUser(UserChatsResponse userModel) async {
    final usersCollectionRef = firestore.collection("users");
    final chatsSenderCollectionRef = usersCollectionRef.doc(Constants.userId).collection("chats");

    chatsSenderCollectionRef.doc(userModel.userId).get().then((value) {
      if (value.exists) {
        return chatsSenderCollectionRef.doc(userModel.userId).update(UserChatsResponse(
                created: UserChatsResponse.fromSnapshot(value).created,
                image: userModel.image,
                nameAr: userModel.nameAr,
                nameEn: userModel.nameEn,
                isRead: UserChatsResponse.fromSnapshot(value).isRead,
                userId: UserChatsResponse.fromSnapshot(value).userId,
                lastMessage: UserChatsResponse.fromSnapshot(value).lastMessage,
                modified: UserChatsResponse.fromSnapshot(value).modified)
            .toDocument());
      }
    });
  }

  @override
  Future<dynamic> makeMessageRead(MakeMessageReadRequest makeMessageReadRequest) async {
    final usersCollectionRef = firestore.collection("users");
    final chatsSenderCollectionRef =
        usersCollectionRef.doc(makeMessageReadRequest.userId).collection("chats");

    chatsSenderCollectionRef.doc(makeMessageReadRequest.recieverModel.userId).get().then((value) {
      if (value.exists) {
        return chatsSenderCollectionRef.doc(makeMessageReadRequest.recieverModel.userId).update(
            UserChatsResponse(
                    created: UserChatsResponse.fromSnapshot(value).created,
                    isRead: makeMessageReadRequest.recieverModel.isRead,
                    image: UserChatsResponse.fromSnapshot(value).image,
                    nameAr: UserChatsResponse.fromSnapshot(value).nameAr,
                    nameEn: UserChatsResponse.fromSnapshot(value).nameEn,
                    userId: UserChatsResponse.fromSnapshot(value).userId,
                    lastMessage: UserChatsResponse.fromSnapshot(value).lastMessage,
                    modified: Timestamp.now())
                .toDocument());
      }
    });
  }

  @override
  Future<dynamic>? uploadFile(String path) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child("images/${Uri.file(path).pathSegments.last}")
        .putFile(File(path))
        .then((value) => value.ref.getDownloadURL().then((value) {
              return value;
            }).catchError((e) {
              return e;
            }))
        .catchError((e) {
      return e;
    });
    return null;
  }
}
