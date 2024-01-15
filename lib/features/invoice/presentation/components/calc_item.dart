import '../../../../common/default/default_text.dart';
import '../../../../core/constants.dart';
import '../../../../utils/app_colors.dart';
import 'package:flutter/material.dart';

class CalcItem extends StatelessWidget {
  const CalcItem(
      {super.key, required this.title, required this.value, this.color, this.titleColor});
  final String title;
  final String value;
  final Color? color;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: DefaultText(
          text: title,
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: titleColor ?? AppColors.black),
        )),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Constants.isArabic ? Alignment.centerLeft : Alignment.centerRight,
            child: DefaultText(
              text: value,
              maxlines: 1,
              textStyle:
                  Theme.of(context).textTheme.bodyMedium?.copyWith(color: color ?? AppColors.blue),
            ),
          ),
        )
      ],
    );
  }
}
