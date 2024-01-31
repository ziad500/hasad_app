import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

class UploadSlipMainItem extends StatelessWidget {
  const UploadSlipMainItem({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
        color: AppColors.grey,
        radius: const Radius.circular(10),
        borderType: BorderType.RRect,
        padding: EdgeInsets.zero,
        strokeWidth: 1,
        dashPattern: const [5, 5],
        child: Container(
          height: 100.h,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(SVGManager.upload),
              const SizedBox(height: 10),
              Flexible(
                child: TitleWidget(
                  title: "JPG, PNG or PDF, File size no more than 5MB",
                  size: 14.sp,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ));
  }
}
