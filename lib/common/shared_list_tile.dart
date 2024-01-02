import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_list_tile.dart';
import 'package:hasad_app/utils/app_colors.dart';

class SharedListTile extends StatelessWidget {
  const SharedListTile({super.key, required this.title, this.trailing, this.leading, this.onTap});
  final String title;
  final Widget? trailing;
  final Widget? leading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(17)),
        child: DefaultListTile(
          dense: true,
          leading: leading,
          title: title,
          onTap: onTap,
          trailing: trailing ??
              Icon(
                Icons.arrow_forward_ios_sharp,
                size: 15.sp,
                color: AppColors.primaryColor,
              ),
        ));
  }
}
