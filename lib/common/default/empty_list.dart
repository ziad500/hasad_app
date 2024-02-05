import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key, this.title1, this.title2, this.scrollable = false});
  final String? title1;
  final String? title2;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    return scrollable
        ? Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /* DefaultText(text: "no more") */ Lottie.asset(JsonManager.empty, height: 400.h),
                ],
              ),
            ),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /* DefaultText(text: "no more") */ Lottie.asset(JsonManager.empty, height: 400.h),
              ],
            ),
          );
  }
}
