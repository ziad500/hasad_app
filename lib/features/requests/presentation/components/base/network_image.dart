import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/utils/app_colors.dart';

class RequestImageWidget extends StatelessWidget {
  const RequestImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: NetworkImageWidget(
        image: null,
        imageBuilder: (context, image) => Container(
          width: 65.w,
          height: 60.h,
          decoration: BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.circular(8)),
        ),
        errorWidget: Container(
          width: 65.w,
          height: 60.h,
          decoration: BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}