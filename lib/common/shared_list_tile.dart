import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_list_tile.dart';
import 'package:hasad_app/utils/app_colors.dart';

class SharedListTile extends StatelessWidget {
  const SharedListTile(
      {super.key,
      required this.title,
      this.trailing,
      this.leading,
      this.onTap,
      this.isSelected = false,
      this.dense = false,
      this.borderRadius = 20,
      this.large = false});
  final String title;
  final Widget? trailing;
  final Widget? leading;
  final void Function()? onTap;
  final bool isSelected;
  final bool? dense;
  final bool large;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: isSelected ? AppColors.darkBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius + 3).w),
      child: Container(
          height: large ? 70 : null,
          margin: const EdgeInsets.all(3).w,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(borderRadius).w),
          child: Center(
            child: DefaultListTile(
              dense: dense,
              leading: leading,
              title: title,
              onTap: onTap,
              trailing: trailing ??
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 15.sp,
                    color: AppColors.primaryColor,
                  ),
            ),
          )),
    );
  }
}
