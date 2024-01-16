import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/features/chats/data/response/messages_response.dart';
import 'package:hasad_app/features/chats/data/response/user_reponse.dart';
import 'package:hasad_app/features/chats/domain/model/user_model.dart';
import 'package:hasad_app/features/chats/presentation/controller/messages/messages_cubit.dart';
import 'package:hasad_app/utils/app_assets.dart';

class SendWidgetSuffixIcon extends StatelessWidget {
  const SendWidgetSuffixIcon({super.key, required this.userModel});
  final UserChatModel? userModel;
  @override
  Widget build(BuildContext context) {
    return BlocListener<MessagesCubit, MessagesState>(
      listener: (context, state) {
        if (state is UploadImageSuccess) {
          MessagesCubit.get(context).uploadFile(
            MessageResponse(
                created: Timestamp.now(),
                recieverId: userModel?.userId,
                text: MessagesCubit.get(context).messageContoller.text,
                senderId: Constants.userId,
                time: Timestamp.now().toString()),
            UserChatsResponse(
                image: userModel?.image,
                nameAr: userModel?.nameAr,
                lastMessage: MessagesCubit.get(context).messageContoller.text,
                nameEn: userModel?.nameEn,
                userId: userModel?.userId),
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => MessagesCubit.get(context).pickFiles(fileType: FileType.image),
            child: SvgPicture.asset(
              SVGManager.camera,
              matchTextDirection: true,
            ),
          ),
          InkWell(
            onTap: () => MessagesCubit.get(context).pickFiles(fileType: FileType.custom),
            child: SvgPicture.asset(
              SVGManager.files,
              matchTextDirection: true,
            ),
          ),
          InkWell(
              onTap: () {
                if (MessagesCubit.get(context).messageContoller.text.trim() != "") {
                  MessagesCubit.get(context).sendMessage(
                    MessageResponse(
                        created: Timestamp.now(),
                        recieverId: userModel?.userId,
                        text: MessagesCubit.get(context).messageContoller.text,
                        senderId: Constants.userId,
                        time: Timestamp.now().toString()),
                    UserChatsResponse(
                        image: userModel?.image,
                        nameAr: userModel?.nameAr,
                        lastMessage: MessagesCubit.get(context).messageContoller.text,
                        nameEn: userModel?.nameEn,
                        userId: userModel?.userId),
                  );

                  MessagesCubit.get(context).messageContoller.clear();
                }
              },
              child: SvgPicture.asset(
                SVGManager.send,
                matchTextDirection: true,
              )),
        ],
      ),
    );
  }
}
