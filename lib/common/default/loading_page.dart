import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black.withOpacity(0.7),
      child: const Center(
          child: /* LottieBuilder.asset(JsonManager.loading, height: 100) */
              CircularProgressIndicator(
        color: AppColors.primaryColor,
      )),
    );
  }
}
