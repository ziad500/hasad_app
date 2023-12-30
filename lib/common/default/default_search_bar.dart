import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

import '../../utils/app_colors.dart';

class DefaultSearchBar extends StatelessWidget {
  const DefaultSearchBar(
      {super.key, this.onChanged, this.onFieldSubmitted, required this.controller});
  final void Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 4,
        right: 8,
        left: 8,
      ),
      child: TextFormField(
        controller: controller,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.textColor, fontSize: 16),
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          hintText: LocaleKeys.search.tr(),
          suffixIcon: const Icon(
            Icons.search,
            color: AppColors.iconColor,
          ),
          hintStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.textColor, fontSize: 16),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
