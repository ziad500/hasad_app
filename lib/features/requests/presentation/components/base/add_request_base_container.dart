import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';

class AddRequestBaseContainer extends StatelessWidget {
  const AddRequestBaseContainer(
      {super.key, this.buttonText, required this.buttonFunction, required this.body});
  final String? buttonText;
  final Function buttonFunction;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: AppColors.addRequestContainerColor,
                  borderRadius: BorderRadius.circular(23)),
              width: double.maxFinite,
              child: body,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          DefaultButton(
              buttonName: buttonText ?? LocaleKeys.next.tr(), buttonFunction: buttonFunction),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
