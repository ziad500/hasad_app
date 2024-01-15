import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/chats/data/response/messages_response.dart';
import 'package:hasad_app/features/chats/data/response/user_reponse.dart';
import 'package:hasad_app/features/chats/presentation/controller/messages/chats_cubit.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MessagesCubit>(),
      child: BlocBuilder<MessagesCubit, MessagesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            floatingActionButton: FloatingActionButton(onPressed: () {
              MessagesCubit.get(context).sendMessage(
                MessageResponse(
                    created: Timestamp.now(),
                    recieverId: "2",
                    senderId: "1",
                    text: "HEllo",
                    time: Timestamp.now().toString()),
                UserChatsResponse(
                    created: Timestamp.now(),
                    image: null,
                    isRead: false,
                    lastMessage: "Hello",
                    modified: Timestamp.now(),
                    nameAr: "زياد",
                    nameEn: "ziad",
                    time: Timestamp.now().toString(),
                    userId: "2"),
              );
              /* SendMessageRequest(
                  messageModel: MessageResponse(
                      created: Timestamp.now(),
                      recieverId: "2",
                      senderId: "1",
                      text: "HEllo",
                      time: Timestamp.now().toString()),
                  recieverModel: UserChatsResponse(
                      created: Timestamp.now(),
                      image: null,
                      isRead: false,
                      lastMessage: "Hello",
                      modified: Timestamp.now(),
                      nameAr: "زياد",
                      nameEn: "ziad",
                      time: Timestamp.now().toString(),
                      title: "",
                      userId: "2"),
                  userId: "1") */
            }),
          );
        },
      ),
    );
  }
}
