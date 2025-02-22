import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/features/chats/core/constants.dart';
import 'package:hasad_app/features/chats/data/response/user_reponse.dart';
import 'package:hasad_app/features/chats/domain/model/user_model.dart';
import 'package:hasad_app/features/chats/presentation/controller/messages/messages_cubit.dart';
import 'package:hasad_app/features/chats/presentation/screens/message_screen.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/helpers.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, this.userChatModel});
  final UserChatModel? userChatModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (!userChatModel!.isRead!) {
            MessagesCubit.get(context).makeMessageRead(
                recieverModel: UserChatsResponse(isRead: true, userId: Constants.userId));
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MessagesScreen(userChatModel: userChatModel)));
        },
        child: Row(
          children: [
            NetworkImageWidget(
              radius: 30,
              image: userChatModel?.image,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundColor: Colors.white, radius: 30, backgroundImage: imageProvider),
              errorWidget: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: SvgPicture.asset(SVGManager.profile)),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: TitleWidget(title: userChatModel?.nameEn ?? "", maxlines: 1)),
                      SubTitleWidget(
                          subTitle: getDateAgo(DateTime.fromMillisecondsSinceEpoch(
                                  userChatModel!.modified!.seconds * 1000)
                              .toString()))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  userChatModel!.lastMessage!.contains(ChatsConstants.fileKey)
                      ? isImage(userChatModel?.lastMessage ?? "")
                          ? const Icon(Icons.image, color: Colors.grey)
                          : const Icon(Icons.attachment_outlined)
                      : Row(
                          children: [
                            Expanded(
                              child: SubTitleWidget(
                                subTitle: userChatModel?.lastMessage ?? "",
                                maxlines: 1,
                              ),
                            ),
                            if (!userChatModel!.isRead!)
                              const Icon(Icons.keyboard_double_arrow_left)
                          ],
                        )
                ],
              ),
            ),
          ],
        ));
  }
}
