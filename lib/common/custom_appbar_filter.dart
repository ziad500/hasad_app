import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

class CustomAppbarWithFilter extends StatelessWidget {
  const CustomAppbarWithFilter({super.key, required this.name, this.onTap});
  final String name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2).w,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: const Color(0xff0A8554).withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          DefaultText(
            text: name,
            textStyle:
                Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
          ),
          _FilterIcon(onTap)
        ],
      ),
    );
  }
}

class _FilterIcon extends StatelessWidget {
  const _FilterIcon(this.onTap);
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            SVGManager.filter,
            height: 18.sp,
            colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
          ),
          const SizedBox(
            width: 5,
          ),
          DefaultText(
            text: "فلتر",
            textStyle:
                Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}
