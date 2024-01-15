import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/utils/app_colors.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({super.key, required this.icon, required this.title});
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 40.h,
      padding: const EdgeInsets.symmetric(horizontal: 15).w,
      decoration: BoxDecoration(
          color: AppColors.addRequestContainerColor, borderRadius: BorderRadius.circular(10.6)),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          Expanded(
            child: Center(
              child: TitleWidget(
                color: Colors.white,
                title: title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
