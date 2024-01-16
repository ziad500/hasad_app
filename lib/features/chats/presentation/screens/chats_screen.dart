import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/empty_list.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/chats/domain/model/user_model.dart';
import 'package:hasad_app/features/chats/presentation/components/chat_widget.dart';
import 'package:hasad_app/features/chats/presentation/controller/messages/messages_cubit.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MessagesCubit>(),
      child: BlocBuilder<MessagesCubit, MessagesState>(
        builder: (context, state) {
          return DefaultScaffold(
            appbarTitle: "Chats",
            appbarColor: Colors.white,
            scaffoldColor: const Color(0xffF0FAF7),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FirestorePagination(
                isLive: true,
                limit: 10,
                onEmpty: const EmptyList(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                query: FirebaseFirestore.instance
                    .collection("users")
                    .doc(Constants.userId)
                    .collection("chats")
                    .orderBy("modified", descending: true),
                itemBuilder: (context, documentSnapshot, index) {
                  final data = documentSnapshot.data() as Map<String, dynamic>;
                  UserChatModel? response = UserChatModel.fromJson(data);
                  return ChatWidget(userChatModel: response);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
