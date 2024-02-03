import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/utils/app_colors.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem(
      {super.key,
      required this.icon,
      required this.title,
      this.pendingBalance,
      this.balance,
      this.iconWidget,
      this.color});
  final String icon;
  final String title;
  final String? pendingBalance;
  final String? balance;
  final Widget? iconWidget;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: double.maxFinite,
          height: 40.h,
          padding: const EdgeInsets.symmetric(horizontal: 15).w,
          decoration: BoxDecoration(
              color: color ?? AppColors.addRequestContainerColor,
              borderRadius: BorderRadius.circular(10.6)),
          child: Row(
            children: [
              iconWidget ?? SvgPicture.asset(icon),
              Expanded(
                child: Center(
                  child: TitleWidget(
                    color: Colors.white,
                    title: title,
                  ),
                ),
              ),
              if (pendingBalance != null)
                TitleWidget(
                  color: AppColors.darkRed,
                  title: pendingBalance ?? "",
                ),
              const SizedBox(width: 15),
              if (balance != null)
                TitleWidget(
                  color: AppColors.blue,
                  title: balance ?? "",
                ),
              const SizedBox(width: 15),
            ],
          ),
        ),
      ],
    );
  }
}
