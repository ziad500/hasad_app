import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/show_modal_bottom_sheet.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/orders_model.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/components/bottomsheets/auth_order_bottom_sheet.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/components/bottomsheets/choose_payment_method_bottom_sheet.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/orders/cubit/direct_selling_orders_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/app_decorations.dart';
import 'package:hasad_app/utils/helpers.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class DirectSellingOrderWidget extends StatelessWidget {
  const DirectSellingOrderWidget({super.key, required this.directSellingOrderModel});
  final DirectSellingOrderModel directSellingOrderModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.invoiceRoutes, arguments: {
        "id": directSellingOrderModel.purchaseInvoiceId.toString(),
      }),
      child: Container(
        width: double.maxFinite,
        decoration: AppDecorations.primaryDecoration,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleWidget(title: isEmpty(directSellingOrderModel.title)),
                      SubTitleWidget(subTitle: isEmpty(directSellingOrderModel.description))
                    ],
                  ),
                ),
                SvgPicture.asset(
                  SVGManager.star,
                  height: 25.sp,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: LocaleKeys.quantity.tr(),
                  textStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.darkRed),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: DefaultText(
                    text: isEmpty(directSellingOrderModel.quantity),
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: "تم الطلب:",
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: AppColors.darkRed),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: DefaultText(
                        text: isEmpty(directSellingOrderModel.createdAt),
                        textStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    )
                  ],
                )),
                const SizedBox(
                  width: 15,
                ),
                DefaultText(
                  text: " ${directSellingOrderModel.price} ${LocaleKeys.saudiRiyal.tr()}",
                  textStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.darkBlue),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                if (directSellingOrderModel.isPaid == 0 &&
                    directSellingOrderModel.isConfirmed == 1) ...[
                  Expanded(
                    child: DefaultButton(
                        height: 35,
                        textSize: 12.sp,
                        color: AppColors.primaryColor,
                        buttonName: LocaleKeys.pay.tr(),
                        buttonFunction: () {
                          DirectSellingOrdersCubit cubit = DirectSellingOrdersCubit.get(context);
                          cubit.paymentMethodResult = null;
                          showModalSheet(
                              context,
                              ChoosePaymentMethodBottomSheet(
                                  directSellingOrdersCubit: cubit,
                                  value: directSellingOrderModel.price.toString(),
                                  purchaseInvoiceId:
                                      directSellingOrderModel.purchaseInvoiceId.toString()));
                        }),
                  )
                ],
                if (directSellingOrderModel.isConfirmed == 0) ...[
                  Expanded(
                    child: DefaultButton(
                        height: 35,
                        textSize: 12.sp,
                        color: AppColors.mainOpacity,
                        textColor: AppColors.primaryColor,
                        buttonName: LocaleKeys.auth.tr(),
                        buttonFunction: () {
                          DirectSellingOrdersCubit cubit = DirectSellingOrdersCubit.get(context);
                          showModalSheet(
                              context,
                              AuthOrderBottomSheet(
                                  directSellingOrdersCubit: cubit,
                                  purchaseInvoiceId:
                                      directSellingOrderModel.purchaseInvoiceId.toString()));
                        }),
                  )
                ]
              ],
            ),
            if (directSellingOrderModel.purchaseInvoiceId != null &&
                /* directSellingOrderModel.receivedDate == null */ directSellingOrderModel
                        .isConfirmed ==
                    1 &&
                directSellingOrderModel.isPaid == 1) ...[
              const SizedBox(height: 10),
              DefaultButton(
                  height: 35,
                  textSize: 12.sp,
                  color: AppColors.red,
                  buttonName: LocaleKeys.doneRecieve.tr(),
                  buttonFunction: () {
                    DirectSellingOrdersCubit.get(context)
                        .confirmOrder(directSellingOrderModel.purchaseInvoiceId.toString());
                  })
            ]
          ],
        ),
      ),
    );
  }
}
