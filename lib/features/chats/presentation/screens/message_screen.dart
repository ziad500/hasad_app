import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/chats/data/response/messages_response.dart';
import 'package:hasad_app/features/chats/data/response/user_reponse.dart';
import 'package:hasad_app/features/chats/domain/model/message_model.dart';
import 'package:hasad_app/features/chats/presentation/controller/messages/messages_cubit.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MessagesCubit>(),
      child: BlocBuilder<MessagesCubit, MessagesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FloatingActionButton(onPressed: () {
                MessagesCubit.get(context).sendMessage(
                  MessageResponse(
                      created: Timestamp.now(),
                      recieverId: "2",
                      senderId: "1",
                      text: "zooosos",
                      time: Timestamp.now().toString()),
                  UserChatsResponse(
                      created: Timestamp.now(),
                      image: null,
                      isRead: false,
                      lastMessage: "zooosos",
                      modified: Timestamp.now(),
                      nameAr: "زياد",
                      nameEn: "ziad",
                      time: Timestamp.now().toString(),
                      userId: "2"),
                );
              }),
            ),
            body: FirestorePagination(
              isLive: true,
              reverse: true,
              limit: 10,
              query: FirebaseFirestore.instance
                  .collection('users')
                  .doc(Constants.userId)
                  .collection("chats")
                  .doc("2")
                  .collection("messages")
                  .orderBy("created", descending: true),
              itemBuilder: (context, documentSnapshot, index) {
                final data = documentSnapshot.data() as Map<String, dynamic>;
                MessageModel? response = MessageModel.fromJson(data);
                return Text(response.text ?? "ss");
              },
            ),
          );
        },
      ),
    );
  }
}
