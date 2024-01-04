import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/price_widget.dart';
import 'package:hasad_app/utils/app_colors.dart';

class ItemDetailsTitleAndPrice extends StatelessWidget {
  const ItemDetailsTitleAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                  text: "خضروات للبيع في مزرعة ",
                  textStyle: Theme.of(context).textTheme.titleMedium),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                      text: "السعر يشمل",
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.darkBlue, fontSize: 14.sp)),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DefaultText(
                        text: "خضروات للبيع في مزرعة ",
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
        const PriceWidget(price: "600")
      ],
    );
  }
}
