import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
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
          text: LocaleKeys.saudiRiyal.tr(),
          textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.darkBlue),
        )
      ],
    );
  }
}
