import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/icon_and_text_widget.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/orders/cubit/direct_selling_orders_cubit.dart';
import 'package:hasad_app/features/sales_order/domain/models/model.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/app_decorations.dart';
import 'package:hasad_app/utils/helpers.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class SalesOrdersWidget extends StatelessWidget {
  const SalesOrdersWidget({super.key, required this.model});
  final SalesOrdersDataModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.invoiceRoutes, arguments: {
        "id": model.purchaseInvoiceId.toString(),
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
                      TitleWidget(title: isEmpty(model.title)),
                      SubTitleWidget(subTitle: isEmpty(model.description))
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
                    text: isEmpty(model.quantity),
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            IconAndText(
                svg: "",
                svgWidget: Icon(
                  model.isConfirmed == 1 ? Icons.check_circle : Icons.cancel,
                  color: model.isConfirmed == 1 ? Colors.green : Colors.red,
                ),
                title: LocaleKeys.confirmed.tr()),
            IconAndText(
                svg: "",
                svgWidget: Icon(
                  model.isPaid == 1 ? Icons.check_circle : Icons.cancel,
                  color: model.isPaid == 1 ? Colors.green : Colors.red,
                ),
                title: LocaleKeys.paid.tr()),
            SizedBox(
              height: 10.h,
            ),
            if (model.confirmationCode != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: LocaleKeys.confirmationCode.tr(),
                    textStyle:
                        Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.darkRed),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: DefaultText(
                      text: isEmpty(model.confirmationCode),
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
                        text: isEmpty(model.createdAt),
                        textStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    )
                  ],
                )),
                const SizedBox(
                  width: 15,
                ),
                DefaultText(
                  text: " ${model.price} ${LocaleKeys.saudiRiyal.tr()}",
                  textStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.darkBlue),
                ),
              ],
            ),
            if (model.purchaseInvoiceId != null &&
                /* directSellingOrderModel.receivedDate == null */ model.isConfirmed == 1 &&
                model.isPaid == 1) ...[
              const SizedBox(height: 10),
              DefaultButton(
                  height: 35,
                  textSize: 12.sp,
                  color: AppColors.red,
                  buttonName: LocaleKeys.doneRecieve.tr(),
                  buttonFunction: () {
                    DirectSellingOrdersCubit.get(context)
                        .confirmOrder(model.purchaseInvoiceId.toString());
                  })
            ]
          ],
        ),
      ),
    );
  }
}
