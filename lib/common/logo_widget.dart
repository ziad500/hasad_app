import 'package:flutter/material.dart';
import 'package:hasad_app/utils/app_assets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesManager.logo,
      width: 80,
    );
  }
}
