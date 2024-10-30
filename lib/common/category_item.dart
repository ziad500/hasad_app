import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/features/categories/domain/models/categories_model.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/helpers.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.categoryListModel,
      this.height,
      this.width,
      this.onTap,
      this.defaultIsSelected});
  final CategoryListModel categoryListModel;
  final double? height;
  final void Function()? onTap;
  final double? width;
  final bool? defaultIsSelected;
  @override
  Widget build(BuildContext context) {
    bool isSelected = defaultIsSelected ??
        AddRequestCubit.get(context).selectedDepartment == categoryListModel.id;
    return InkWell(
      onTap: onTap ??
          () {
            AddRequestCubit.get(context)
                .selectDepartment(int.parse(categoryListModel.id.toString()));
          },
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
            children: [
              Expanded(child: _NetowrkImage(categoryListModel.image)),
              const SizedBox(
                height: 7,
              ),
              DefaultText(
                text: isEmpty(categoryListModel.name),
                textStyle: Theme.of(context).textTheme.bodyMedium,
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
