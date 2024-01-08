import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({super.key, this.imageUrl, this.radius});
  final String? imageUrl;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return NetworkImageWidget(
      image: imageUrl,
      imageBuilder: (_, image) => CircleAvatar(
        radius: radius == null ? 25.sp : radius!.sp,
        backgroundImage: image,
      ),
      errorWidget: CircleAvatar(
        radius: radius == null ? 25.sp : radius!.sp,
        backgroundColor: AppColors.primaryColor,
        child: SvgPicture.asset(
          SVGManager.user,
          height: radius != null ? (radius! - 2).sp : 23.sp,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
      placeholder: (context, _) => CircleAvatar(
        radius: radius == null ? 25.sp : radius!.sp,
        backgroundColor: AppColors.primaryColor,
        child: const CircularProgressIndicator(
          color: AppColors.white,
        ),
      ),
    );
  }
}
