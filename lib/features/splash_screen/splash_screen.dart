import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/features/layout/layout.dart';
import 'package:hasad_app/features/splash_screen/splash_background.dart';
import 'package:hasad_app/utils/app_assets.dart';

import '../../../core/constants.dart';
import '../auth/presentation/screens/login/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: Constants.token != "" ? const LayoutScreen() : const LoginScreen(),
      centered: true,
      backgroundColor: Colors.white,
      splashIconSize: MediaQuery.of(context).size.height,
      duration: 3200,
      splash: Scaffold(
        body: SplashBackGround(
          child: Padding(
            padding: EdgeInsets.only(top: 150.h),
            child: SizedBox(
              child: Image.asset(
                ImagesManager.logo,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
