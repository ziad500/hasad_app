import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/icon_and_text_widget.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

class ItemLocationWidget extends StatelessWidget {
  const ItemLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          text: "موقع الاعلان",
          textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.blueAccent),
        ),
        const SizedBox(
          height: 10,
        ),
        IconAndText(svg: SVGManager.location, title: "حائل -البقعاء - الغزالة"),
      ],
    );
  }
}
