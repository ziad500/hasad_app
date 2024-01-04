import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/utils/app_colors.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultText(
          text: price,
          textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.darkBlue),
        ),
        DefaultText(
          text: "ريال سعودي",
          textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.darkBlue),
        )
      ],
    );
  }
}
