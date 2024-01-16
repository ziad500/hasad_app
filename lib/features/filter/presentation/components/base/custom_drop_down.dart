import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/custom_drop_down.dart';
import 'package:hasad_app/utils/app_colors.dart';

class FilterDropDown extends StatelessWidget {
  const FilterDropDown(
      {super.key,
      required this.list,
      required this.hint,
      required this.title,
      required this.onOptionSelected});
  final List<OptionItem> list;
  final String hint;
  final String title;
  final void Function(OptionItem?) onOptionSelected;

  @override
  Widget build(BuildContext context) {
    return CustomDropDown(
        list: list,
        textColor: AppColors.primaryColor,
        hint: hint,
        onOptionSelected: onOptionSelected,
        title: title,
        borderRadius: 17,
        borderColor: Colors.transparent);
  }
}
