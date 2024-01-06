import 'package:flutter/material.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/common/user_image.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/utils/helpers.dart';

class UserRowWidget extends StatelessWidget {
  const UserRowWidget({super.key, this.userModel, required this.date});
  final UserModel? userModel;
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
            SubTitleWidget(subTitle: "تم النشر بتاريخ $date ")
          ],
        ))
      ],
    );
  }
}
