import '../../utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.size = 80});
  final double size;

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: AppColors.primaryColor,
    ) /*  LottieBuilder.asset(
      JsonManager.loading,
      height: size,
    ) */
        );
  }
}
