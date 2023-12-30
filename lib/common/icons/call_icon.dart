import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/utils/app_assets.dart';

class IconCall extends StatelessWidget {
  const IconCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [SvgPicture.asset(SVGManager.circle), SvgPicture.asset(SVGManager.call)],
    );
  }
}
