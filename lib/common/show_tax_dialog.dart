import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/shared_bottom_sheet.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/components/show_choose_payment_mehod_bottomsheet.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/controller/cubit/direct_selling_details_cubit.dart';
import 'package:hasad_app/features/invoice/presentation/components/calc_item.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

Future showTaxBottomSheet(context,
        {required num? price,
        required num? tax,
        required Function buttonFunction,
        String? note,
        int? cashOnDelivery,
        DirectSellingDetailsCubit? directSellingcubit}) =>
    defaultshowModalBottomSheet(
      context: context,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CalcItem(
                title: LocaleKeys.price.tr(), value: "${price ?? 0} ${LocaleKeys.saudiRiyal.tr()}"),
            SizedBox(
              height: 10.h,
            ),
            CalcItem(
                title: LocaleKeys.tax.tr(), value: "${tax!.abs()} ${LocaleKeys.saudiRiyal.tr()}"),
            SizedBox(
              height: 10.h,
            ),
            CalcItem(
                title: LocaleKeys.totalPrice.tr(),
                value: "${price! + tax.abs()} ${LocaleKeys.saudiRiyal.tr()}"),
            if (note != null) ...[
              SizedBox(height: 20.h),
              DefaultText(
                text: note,
                color: Colors.red,
                fontSize: 12.sp,
              ),
            ],
            SizedBox(
              height: 10.h,
            ),
            DefaultButton(
                buttonName: LocaleKeys.buyNow.tr(),
                buttonFunction: () {
                  Navigator.pop(context);
                  if (directSellingcubit != null && cashOnDelivery == 1) {
                    showPaymentMethodBottomSheet(context, directSellingcubit: directSellingcubit,
                        buttonFunction: () {
                      buttonFunction();
                    });
                  } else {
                    buttonFunction();
                  }
                })
          ],
        ),
      ),
    );
