import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/utils/app_colors.dart';

class SharedCheckBoxButton extends StatelessWidget {
  const SharedCheckBoxButton({
    super.key,
    required this.title,
    this.isSelected = false,
    required this.onChanged,
    this.image,
  });
  final String title;

  final bool isSelected;

  final void Function(bool?) onChanged;

  final Widget? image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(true),
      child: Container(
          margin: const EdgeInsets.all(3).w,
          width: double.maxFinite,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(17).w),
          child: Center(
              child: Row(
            children: [
              Checkbox(
                value: isSelected,
                checkColor: AppColors.white,
                activeColor: AppColors.primaryColor,
                onChanged: onChanged,
                shape: const CircleBorder(),
              ),
              if (image != null) ...[
                image!,
                SizedBox(
                  width: 10.w,
                )
              ],
              Expanded(child: Center(child: TitleWidget(title: title))),
            ],
          ))),
    );
  }
}
