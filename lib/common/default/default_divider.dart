import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({super.key, this.indent});
  final double? indent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.textGrey,
      indent: indent,
      endIndent: indent,
    );
  }
}
