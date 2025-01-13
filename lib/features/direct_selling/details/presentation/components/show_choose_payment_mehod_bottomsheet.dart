import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/shared_bottom_sheet.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/controller/cubit/direct_selling_details_cubit.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/payment_Widget.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

Future showPaymentMethodBottomSheet(context,
        {required Function buttonFunction,
        String? note,
        required DirectSellingDetailsCubit directSellingcubit}) =>
    defaultshowModalBottomSheet(
      context: context,
      child: BlocProvider.value(
        value: directSellingcubit,
        child: BlocBuilder<DirectSellingDetailsCubit, DirectSellingDetailsState>(
          builder: (context, state) {
            DirectSellingDetailsCubit cubit = DirectSellingDetailsCubit.get(context);
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TitleWidget(title: LocaleKeys.choosePaymentMethod.tr()),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                          child: PaymentMethodWidget(
                              onTap: () {
                                cubit.selectedPaymentMethodFunc(1);
                              },
                              defaultIsSelected: cubit.selectedPaymentMethod == 1,
                              name: LocaleKeys.paymentOnDelivery.tr(),
                              id: "1",
                              icon: const Icon(
                                Icons.delivery_dining,
                                size: 50,
                              ))),
                      const SizedBox(width: 10),
                      Expanded(
                          child: PaymentMethodWidget(
                              onTap: () {
                                cubit.selectedPaymentMethodFunc(0);
                              },
                              defaultIsSelected: cubit.selectedPaymentMethod == 0,
                              name: LocaleKeys.wallet.tr(),
                              id: "0",
                              icon: const Icon(
                                Icons.wallet,
                                size: 50,
                              ))),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DefaultButton(
                      buttonName: LocaleKeys.buyNow.tr(),
                      buttonFunction: () {
                        Navigator.pop(context);
                        buttonFunction();
                      })
                ],
              ),
            );
          },
        ),
      ),
    );
