import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/chats/domain/model/message_model.dart';
import 'package:hasad_app/features/chats/domain/model/user_model.dart';
import 'package:hasad_app/features/chats/presentation/components/message_widget.dart';
import 'package:hasad_app/features/chats/presentation/components/send_message_widget.dart';
import 'package:hasad_app/features/chats/presentation/controller/messages/messages_cubit.dart';
import 'package:hasad_app/utils/app_assets.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key, required this.userChatModel});
  final UserChatModel? userChatModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MessagesCubit>(),
      child: BlocBuilder<MessagesCubit, MessagesState>(
        builder: (context, state) {
          return DefaultScaffold(
            appbarTitle: userChatModel?.nameEn,
            titleWidget: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                NetworkImageWidget(
                  radius: 30,
                  image: userChatModel?.image,
                  errorWidget: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: SvgPicture.asset(SVGManager.profile)),
                ),
                Expanded(child: TitleWidget(title: userChatModel?.nameEn ?? "", maxlines: 1))
              ],
            ),
            appbarColor: Colors.white,
            scaffoldColor: const Color(0xffF0FAF7),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    child: FirestorePagination(
                      isLive: true,
                      shrinkWrap: true,
                      viewType: ViewType.list,
                      reverse: true,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
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
                        return MessageWidget(messageModel: response);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SendMessageWidget(userModel: userChatModel)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
