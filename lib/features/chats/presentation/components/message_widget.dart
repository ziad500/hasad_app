import 'package:flutter/material.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/features/chats/domain/model/message_model.dart';
import 'package:hasad_app/utils/app_colors.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, this.messageModel});
  final MessageModel? messageModel;
  @override
  Widget build(BuildContext context) {
    bool isMine = messageModel?.senderId == Constants.userId;
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
            color: isMine ? AppColors.primaryColor : Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(10),
                bottomRight: const Radius.circular(10),
                topLeft: isMine ? const Radius.circular(0) : const Radius.circular(10),
                topRight: isMine ? const Radius.circular(10) : const Radius.circular(0))),
        child: TitleWidget(
          title: messageModel?.text ?? "",
          color: isMine ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
