import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/utils/app_colors.dart';

class WalletSubWidget extends StatelessWidget {
  const WalletSubWidget({super.key, required this.title, required this.icon, this.onTap});
  final String title;
  final String icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13).w,
              border: Border.all(color: AppColors.blue, width: 2)),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12).w,
          child: Row(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 15),
              Flexible(
                child: TitleWidget(
                  title: title,
                  color: AppColors.blue,
                  size: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )),
    );
  }
}
