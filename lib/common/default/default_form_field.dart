import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField(
      {super.key,
      required this.controller,
      required this.hint,
      this.maxLines = 1,
      this.textInputType = TextInputType.text,
      required this.validator,
      this.suffix,
      this.borderColro,
      this.onChanged,
      this.onEditingComplete,
      this.obscureText = false,
      this.onFieldSubmitted,
      this.maxLength,
      this.onTap,
      this.prefix,
      this.onSuffixTap,
      this.enabled = true,
      this.textColor = Colors.grey,
      this.bottomBorderColor = Colors.transparent,
      this.width = double.infinity,
      this.contentPadding,
      this.inputFormatters,
      this.title,
      this.textAlign = TextAlign.start,
      this.errorOcure = true,
      this.fillColor = Colors.white,
      this.horizontalPadding = 40,
      this.label,
      this.hintColor});
  final TextEditingController controller;
  final String hint;
  final int? maxLines;
  final double width;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final TextInputType textInputType;
  final FormFieldValidator validator;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final bool obscureText;
  final Color? borderColro;
  final Function(String)? onFieldSubmitted;
  final int? maxLength;
  final void Function()? onTap;
  final void Function()? onSuffixTap;
  final Color textColor;
  final Color bottomBorderColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final String? title;
  final bool errorOcure;
  final TextAlign textAlign;
  final Color? fillColor;
  final double horizontalPadding;
  final String? label;
  final Color? hintColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5,
          )
        ],
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: hintColor ?? AppColors.hintColor),
          inputFormatters:
              (textInputType == TextInputType.number || textInputType == TextInputType.phone)
                  ? <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ]
                  : inputFormatters,
          keyboardType: textInputType,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          textAlign: textAlign,
          onEditingComplete: () => onEditingComplete ?? FocusScope.of(context).nextFocus(),
          enableSuggestions: true,
          maxLength: maxLength,
          validator: validator,
          obscureText: obscureText,
          controller: controller,
          enabled: enabled,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          maxLines: maxLines,
          onTap: onTap,
          decoration: InputDecoration(
            counterText: "",
            errorMaxLines: 3, fillColor: fillColor, filled: fillColor != null,

            isDense: true,
            prefixIconColor: AppColors.iconColor,
            suffixIconColor: AppColors.iconColor,
            hintStyle: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: hintColor ?? AppColors.hintColor),
            contentPadding:
                contentPadding ?? const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            hintText: hint,

            prefixIcon: prefix,
            prefixIconConstraints:
                BoxConstraints(maxHeight: 25, maxWidth: 50.w, minHeight: 25, minWidth: 50.w),
            suffixIcon: suffix == null ? null : InkWell(onTap: onSuffixTap, child: suffix),
            suffixIconConstraints:
                BoxConstraints(maxHeight: 25, maxWidth: 50.w, minHeight: 25, minWidth: 50.w),

            //border party!

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30).w,
              borderSide: BorderSide(color: borderColro ?? Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30).w,
              borderSide: BorderSide(color: borderColro ?? Colors.transparent),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30).w,
              borderSide: BorderSide(color: borderColro ?? Colors.transparent),
            ),
            errorStyle: TextStyle(color: Colors.red, fontSize: errorOcure ? 14 : 0),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30).w,
              borderSide: BorderSide(color: borderColro ?? AppColors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30).w,
              borderSide: BorderSide(color: borderColro ?? Colors.transparent),
            ), /*   hintStyle: StyleManager.greyTextStyle14 */
          ),
        ),
      ],
    );
  }
}
