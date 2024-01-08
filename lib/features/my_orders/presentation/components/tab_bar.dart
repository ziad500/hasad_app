import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';

class MyOrdersTabBar extends StatelessWidget {
  const MyOrdersTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        indicatorColor: AppColors.addRequestContainerColor,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(26).w, color: AppColors.addRequestContainerColor),
        tabs: [
          const Tab(
            text: "مزاد",
          ),
          Tab(
            text: LocaleKeys.directSale.tr(),
          )
        ]);
  }
}