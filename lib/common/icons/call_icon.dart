import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

class IconCall extends StatelessWidget {
  const IconCall({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          SVGManager.circle,
          colorFilter: ColorFilter.mode(color ?? AppColors.primaryColor, BlendMode.srcIn),
        ),
        SvgPicture.asset(SVGManager.call)
      ],
    );
  }
}
