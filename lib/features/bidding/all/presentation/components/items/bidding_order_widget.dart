import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/show_modal_bottom_sheet.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/bidding/all/domain/models/orders_model.dart';
import 'package:hasad_app/features/bidding/all/presentation/components/auth_order_bottom_sheet.dart';
import 'package:hasad_app/features/bidding/all/presentation/components/reject_bottomsheet.dart';
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
                    color: biddingOrderModel.purchase?.isPaid == 0
                        ? AppColors.red
                        : AppColors.primaryColor,
                    buttonName: biddingOrderModel.purchase?.isPaid == 0
                        ? LocaleKeys.pleasePay.tr()
                        : LocaleKeys.donePayment.tr(),
                    buttonFunction: () {
                      if (biddingOrderModel.purchase?.isPaid == 0) {
                        BiddingOrdersCubit.get(context)
                            .buyOrderAfterWin(biddingOrderModel.advertisementId!);
                      }
                    })
              ],
            ),
            /* 
            ... */
            if (biddingOrderModel.purchase?.isConfirmed == 0 &&
                biddingOrderModel.purchase?.isPaid == 1) ...[
              SizedBox(
                height: 10.h,
              ),
              DefaultButton(
                  height: 35,
                  textSize: 12.sp,
                  color: AppColors.mainOpacity,
                  textColor: AppColors.primaryColor,
                  buttonName: LocaleKeys.auth.tr(),
                  buttonFunction: () {
                    BiddingOrdersCubit cubit = BiddingOrdersCubit.get(context);
                    showModalSheet(
                        context,
                        BiddingAuthOrderBottomSheet(
                            biddingOrdersCubit: cubit,
                            purchaseInvoiceId: biddingOrderModel.purchaseInvoiceId.toString()));
                  })
            ],

            /*   if (directSellingOrderModel.purchaseInvoiceId != null &&
                directSellingOrderModel.receivedDate == null &&
                directSellingOrderModel.isConfirmed == 1 &&
                directSellingOrderModel.isPaid == 1) ... */
            if ((biddingOrderModel.purchase?.isReceived == 2 ||
                biddingOrderModel.purchase?.isReceived == 3)) ...[
              const SizedBox(height: 10),
              DefaultButton(
                  height: 35,
                  textSize: 12.sp,
                  color: biddingOrderModel.purchase?.isReceived == 2 ? Colors.green : Colors.red,
                  buttonName: biddingOrderModel.purchase?.isReceived == 2
                      ? LocaleKeys.doneRecieve.tr()
                      : LocaleKeys.doneReject.tr(),
                  buttonFunction: () {}),
              if (biddingOrderModel.purchase?.rejectReason != null &&
                  biddingOrderModel.purchase?.rejectReason != "") ...[
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.6), borderRadius: BorderRadius.circular(15)),
                  child: SubTitleWidget(
                    subTitle: biddingOrderModel.purchase?.rejectReason ?? "",
                    color: Colors.white,
                  ),
                )
              ]
            ],
            if (biddingOrderModel.purchase?.isPaid == 1 &&
                biddingOrderModel.purchaseInvoiceId != null &&
                (biddingOrderModel.purchase?.isReceived == 1) &&
                biddingOrderModel.purchase?.isConfirmed == 1) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                        height: 35,
                        textSize: 12.sp,
                        color: AppColors.primaryColor,
                        buttonName: LocaleKeys.doneRecieve.tr(),
                        buttonFunction: () {
                          BiddingOrdersCubit.get(context)
                              .confirmOrder(biddingOrderModel.purchaseInvoiceId!, "2", "");
                        }),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: DefaultButton(
                        height: 35,
                        textSize: 12.sp,
                        color: AppColors.red,
                        buttonName: LocaleKeys.rejectRecieve.tr(),
                        buttonFunction: () {
                          BiddingOrdersCubit cubit = BiddingOrdersCubit.get(context);
                          showModalSheet(
                              context,
                              RejectOrderBottomSheet(
                                  biddingOrdersCubit: cubit,
                                  purchaseInvoiceId:
                                      biddingOrderModel.purchaseInvoiceId.toString()));
                        }),
                  ),
                ],
              )
            ] /* 
            ... */
            /*      if (biddingOrderModel.paymentdate != null &&
                biddingOrderModel.purchaseInvoiceId != null &&
                biddingOrderModel.receivedDate == null) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                        height: 35,
                        textSize: 12.sp,
                        color: AppColors.primaryColor,
                        buttonName: LocaleKeys.doneRecieve.tr(),
                        buttonFunction: () {
                          BiddingOrdersCubit.get(context)
                              .confirmOrder(biddingOrderModel.purchaseInvoiceId!);
                        }),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: DefaultButton(
                        height: 35,
                        textSize: 12.sp,
                        color: AppColors.red,
                        buttonName: LocaleKeys.rejectRecieve.tr(),
                        buttonFunction: () {
                          BiddingOrdersCubit.get(context)
                              .confirmOrder(biddingOrderModel.purchaseInvoiceId!);
                        }),
                  ),
                ],
              )
            ]
        */
          ],
        ),
      ),
    );
  }
}
