import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({super.key, this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return NetworkImageWidget(
      image: imageUrl,
      imageBuilder: (_, image) => CircleAvatar(
        radius: 25.sp,
        backgroundImage: image,
      ),
      errorWidget: CircleAvatar(
        radius: 25.sp,
        backgroundColor: AppColors.primaryColor,
        child: SvgPicture.asset(
          SVGManager.user,
          height: 23.sp,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
      placeholder: (context, _) => CircleAvatar(
        radius: 25.sp,
        backgroundColor: AppColors.primaryColor,
        child: const CircularProgressIndicator(
          color: AppColors.white,
        ),
      ),
    );
  }
}
