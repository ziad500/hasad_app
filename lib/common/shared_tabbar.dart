import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';

class SharedTabBar extends StatelessWidget {
  const SharedTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45.h,
        margin: const EdgeInsets.symmetric(horizontal: 20).w,
        width: double.maxFinite,
        decoration:
            BoxDecoration(color: AppColors.mainOpacity, borderRadius: BorderRadius.circular(26).w),
        child: const _TabBar());
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar();

  @override
  Widget build(BuildContext context) {
    return TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        indicatorColor: AppColors.addRequestContainerColor,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(26).w, color: AppColors.addRequestContainerColor),
        tabs: [
          Tab(
            text: LocaleKeys.auction.tr(),
          ),
          Tab(
            text: LocaleKeys.directSale.tr(),
          )
        ]);
  }
}
