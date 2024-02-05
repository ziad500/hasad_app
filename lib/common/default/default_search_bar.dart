import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';

import '../../utils/app_colors.dart';

class DefaultSearchBar extends StatelessWidget {
  const DefaultSearchBar(
      {super.key, this.onChanged, this.onFieldSubmitted, required this.controller});
  final void Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.labelLarge,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 15,
        ),
        hintText: LocaleKeys.search.tr(),
        prefixIconConstraints:
            const BoxConstraints(maxHeight: 30, maxWidth: 40, minHeight: 30, minWidth: 40),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SvgPicture.asset(
            SVGManager.search,
          ),
        ),
        hintStyle: Theme.of(context).textTheme.labelLarge,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.white),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
