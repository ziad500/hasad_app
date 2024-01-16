import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_form_field.dart';
import 'package:hasad_app/features/chats/domain/model/user_model.dart';
import 'package:hasad_app/features/chats/presentation/components/sen_message_suffix_widget.dart';
import 'package:hasad_app/features/chats/presentation/controller/messages/messages_cubit.dart';
import 'package:hasad_app/utils/app_colors.dart';

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({super.key, required this.userModel});
  final UserChatModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: BlocBuilder<MessagesCubit, MessagesState>(
        builder: (context, state) {
          var cubit = MessagesCubit.get(context);
          return DefaultFormField(
              fillColor: AppColors.scaffoldColor,
              controller: cubit.messageContoller,
              hint: "send",
              suffixWidth: 100,
              suffix: SendWidgetSuffixIcon(userModel: userModel),
              validator: (value) {
                return null;
              });
        },
      ),
    );
  }
}
