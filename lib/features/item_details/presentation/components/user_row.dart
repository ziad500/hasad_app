import 'package:flutter/material.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/common/user_image.dart';

class UserRowWidget extends StatelessWidget {
  const UserRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        UserImageWidget(image: null),
        SizedBox(
          width: 15,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(title: "محمد سالم"),
            SizedBox(
              height: 10,
            ),
            SubTitleWidget(subTitle: "تم النشر بتاريخ 20/12/2022 ")
          ],
        ))
      ],
    );
  }
}
