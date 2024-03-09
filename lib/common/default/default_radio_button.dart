import 'default_text.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class DefaultRadioButton extends StatelessWidget {
  const DefaultRadioButton(
      {super.key,
      required this.label,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      this.color});
  final String label;
  final dynamic value;
  final dynamic groupValue;
  final void Function(dynamic) onChanged;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: AppColors.primaryColor,
            fillColor: MaterialStatePropertyAll(color)),
        DefaultText(
          text: label,
          textStyle: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }
}
