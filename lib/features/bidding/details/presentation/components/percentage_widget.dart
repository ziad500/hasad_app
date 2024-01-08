import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/utils/app_colors.dart';

class PercentageWidget extends StatelessWidget {
  const PercentageWidget({super.key, required this.value});
  final double value;

  @override
  Widget build(BuildContext context) {
    return Center(
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
