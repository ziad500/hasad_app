import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/common/user_image.dart';
import 'package:hasad_app/features/profile/domain/models/profile_model.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/helpers.dart';

class UserRowWidget extends StatelessWidget {
  const UserRowWidget({super.key, this.userModel, required this.date});
  final ProfileDataModel? userModel;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserImageWidget(imageUrl: userModel?.image),
        const SizedBox(
          width: 15,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(title: isEmpty(userModel?.name)),
            const SizedBox(
              height: 10,
            ),
            SubTitleWidget(subTitle: "${LocaleKeys.publishedOn.tr()} $date ")
          ],
        ))
      ],
    );
  }
}
