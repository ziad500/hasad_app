import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/utils/app_colors.dart';

class PercentageWidget extends StatelessWidget {
  const PercentageWidget({super.key, required this.value, required this.notStarted});
  final double value;
  final bool notStarted;
  @override
  Widget build(BuildContext context) {
    print("..........$value");
    return notStarted
        ? Center(
            child: SizedBox(
              height: 200.w,
              width: 200.w,
              child: CircularProgressIndicator(
                value: 1,
                strokeWidth: 20.sp,
                strokeCap: StrokeCap.round,
                color: const Color(0xff8AB2A3),
              ),
            ),
          )
        : Center(
            child: SizedBox(
              height: 200.w,
              width: 200.w,
              child: CircularProgressIndicator(
                value: value,
                strokeWidth: 20.sp,
                backgroundColor: AppColors.percentageSecondary,
                strokeCap: StrokeCap.round,
                color: AppColors.primaryColor,
              ),
            ),
          );
  }
}
