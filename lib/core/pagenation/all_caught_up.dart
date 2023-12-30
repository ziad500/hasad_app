import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCaughtUpWidget extends StatelessWidget {
  const AllCaughtUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "AppStrings.allCaughtUp.tr()",
            style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor),
          ),
          SizedBox(width: 2.w),
          CircleAvatar(
            radius: 4.w,
            backgroundColor: AppColors.primaryColor,
            child: Icon(
              Icons.done_rounded,
              color: Colors.white,
              size: 20.sp,
            ),
          )
        ],
      ),
    );
  }
}
