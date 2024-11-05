import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/helpers.dart';

class GridviewItem extends StatelessWidget {
  const GridviewItem(
      {super.key,
      this.height,
      this.width,
      required this.onTap,
      required this.defaultIsSelected,
      required this.name,
      required this.id,
      required this.image});
  final String name;
  final String id;
  final String image;
  final double? height;
  final void Function() onTap;
  final double? width;
  final bool defaultIsSelected;
  @override
  Widget build(BuildContext context) {
    bool isSelected = defaultIsSelected;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3).w,
        decoration: BoxDecoration(
            color: isSelected ? AppColors.darkBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(28).w),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10).w,
          width: width ?? 80.w,
          height: height ?? 150.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25).w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _NetowrkImage(image)),
              const SizedBox(
                height: 7,
              ),
              DefaultText(
                text: isEmpty(name),
                textStyle: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _NetowrkImage extends StatelessWidget {
  const _NetowrkImage(this.image);
  final String? image;

  @override
  Widget build(BuildContext context) {
    return NetworkImageWidget(
      image: image,
      imageBuilder: (_, image) => Container(
        width: 230.w - 20.w,
        decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.cover),
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)),
      ),
      errorWidget: Container(
        width: 230.w - 20.w,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
