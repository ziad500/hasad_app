import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, this.isSelcted = false});
  final bool isSelcted;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3).w,
      decoration: BoxDecoration(
          color: isSelcted ? AppColors.darkBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(28).w),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10).w,
        width: 80.w,
        height: 150.h,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25).w),
        child: Column(
          children: [
            const Expanded(child: _NetowrkImage()),
            const SizedBox(
              height: 7,
            ),
            DefaultText(
              text: "خضار",
              textStyle: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}

class _NetowrkImage extends StatelessWidget {
  const _NetowrkImage({super.key});

  @override
  Widget build(BuildContext context) {
    return NetworkImageWidget(
      image: null,
      imageBuilder: (_, image) => Container(
        width: 230.w - 20.w,
        decoration: BoxDecoration(
            image: DecorationImage(image: image),
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)),
      ),
      errorWidget: Container(
        width: 230.w - 20.w,
        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
