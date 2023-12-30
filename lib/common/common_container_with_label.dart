import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CommoncontainerWithLabel extends StatelessWidget {
  const CommoncontainerWithLabel({super.key, required this.child, required this.label});
  final Widget child;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8).w,
                border: Border.all(color: AppColors.borderColor)),
            child: child),
        Container(
          margin: const EdgeInsets.fromLTRB(7, 0, 15, 0),
          padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
          color: Colors.white,
          child: Text(label,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.black)),
        )
      ],
    );
  }
}
