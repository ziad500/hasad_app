import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/bidding/all/domain/models/orders_model.dart';
import 'package:hasad_app/features/bidding/all/presentation/controller/orders/cubit/bidding_orders_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/app_decorations.dart';
import 'package:hasad_app/utils/helpers.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class BiddingOrderWidget extends StatelessWidget {
  const BiddingOrderWidget({super.key, required this.biddingOrderModel});
  final BiddingOrderModel biddingOrderModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => biddingOrderModel.purchaseInvoiceId == null
          ? null
          : Navigator.pushNamed(context, Routes.biddingInvoiceScreen, arguments: {
              "id": biddingOrderModel.purchaseInvoiceId.toString(),
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
                      TitleWidget(title: isEmpty(biddingOrderModel.title)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      SVGManager.star,
                      height: 25.sp,
                    ),
                    const SizedBox(height: 5),
                    SubTitleWidget(subTitle: LocaleKeys.biddingWin.tr())
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: "${LocaleKeys.donefinish.tr()} :",
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
                        text: isEmpty(biddingOrderModel.expiryTime),
                        textStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    )
                  ],
                )),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                    child: DefaultText(
                  text: " ${biddingOrderModel.priceAfterTax} ${LocaleKeys.saudiRiyal.tr()}",
                  textStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.darkBlue),
                )),
                DefaultButton(
                    height: 35,
                    width: 100.w,
                    textSize: 12.sp,
                    color: biddingOrderModel.paymentdate == null
                        ? AppColors.red
                        : AppColors.primaryColor,
                    buttonName: biddingOrderModel.paymentdate == null
                        ? LocaleKeys.pleasePay.tr()
                        : LocaleKeys.donePayment.tr(),
                    buttonFunction: () {
                      if (biddingOrderModel.paymentdate == null) {
                        BiddingOrdersCubit.get(context)
                            .buyOrderAfterWin(biddingOrderModel.advertisementId!);
                      }
                    })
              ],
            ),
            if (biddingOrderModel.paymentdate != null &&
                biddingOrderModel.purchaseInvoiceId != null &&
                biddingOrderModel.receivedDate == null) ...[
              const SizedBox(height: 10),
              DefaultButton(
                  height: 35,
                  textSize: 12.sp,
                  color: AppColors.red,
                  buttonName: LocaleKeys.doneRecieve.tr(),
                  buttonFunction: () {
                    BiddingOrdersCubit.get(context)
                        .confirmOrder(biddingOrderModel.purchaseInvoiceId!);
                  })
            ]
          ],
        ),
      ),
    );
  }
}
