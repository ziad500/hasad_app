import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/helpers.dart';

class TypeDetailsRowWidget extends StatelessWidget {
  const TypeDetailsRowWidget({super.key, this.directSellingDataModel});

  final DirectSellingDataModel? directSellingDataModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: _Item(
                title: LocaleKeys.cropType.tr(),
                subTitle: directSellingDataModel?.agricultureType?.name,
                image: directSellingDataModel?.agricultureType?.image)),
        SizedBox(
          width: 15.w,
        ),
        Expanded(
            child: _Item(
                title: LocaleKeys.packagingType.tr(),
                subTitle: directSellingDataModel?.packagingType?.name,
                image: directSellingDataModel?.packagingType?.image)),
        SizedBox(
          width: 15.w,
        ),
        Expanded(
            child: _Item(
                title: LocaleKeys.harvestDate.tr(),
                subTitle: directSellingDataModel?.agricultureType?.name,
                image: directSellingDataModel?.agricultureType?.image))
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.title, required this.subTitle, required this.image});
  final String? title;
  final String? subTitle;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(title: isEmpty(title)),
        const SizedBox(
          height: 10,
        ),
        NetworkImageWidget(
          image: image,
          errorWidget: Container(
            height: 60.h,
            width: 70.w,
            decoration:
                BoxDecoration(color: AppColors.grey, borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.error),
          ),
          imageBuilder: (_, image) => Container(
            height: 60.h,
            width: 70.w,
            decoration: BoxDecoration(
                image: DecorationImage(image: image, fit: BoxFit.cover),
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SubTitleWidget(subTitle: isEmpty(subTitle))
      ],
    );
  }
}