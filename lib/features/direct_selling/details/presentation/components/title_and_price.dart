import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/price_widget.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/helpers.dart';

class ItemDetailsTitleAndPrice extends StatelessWidget {
  const ItemDetailsTitleAndPrice({super.key, this.directSellingDataModel});
  final DirectSellingDataModel? directSellingDataModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                  text: isEmpty(directSellingDataModel?.title),
                  textStyle: Theme.of(context).textTheme.titleMedium),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                      text: LocaleKeys.priceIncludes.tr(),
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.darkBlue, fontSize: 14.sp)),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DefaultText(
                        text: directSellingDataModel?.priceInclusions == null
                            ? " "
                            : directSellingDataModel!.priceInclusions!.join(","),
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.primaryColor, fontSize: 14.sp)),
                  ),
                ],
              )
            ],
          ),
        ),
        PriceWidget(
            price: directSellingDataModel?.purchasingPrice == null
                ? directSellingDataModel?.price == null
                    ? ""
                    : directSellingDataModel!.price.toString()
                : directSellingDataModel!.purchasingPrice.toString())
      ],
    );
  }
}
