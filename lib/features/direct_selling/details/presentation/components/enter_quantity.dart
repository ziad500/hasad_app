import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_form_field.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/shared_bottom_sheet.dart';
import 'package:hasad_app/common/show_tax_dialog.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/controller/cubit/direct_selling_details_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';

Future showQuantityBottomSheet(context2, {DirectSellingDetailsCubit? cubit}) =>
    defaultshowModalBottomSheet(
      context: context2,
      withHeader: false,
      child: BlocProvider.value(
        value: cubit!,
        child: BlocBuilder<DirectSellingDetailsCubit, DirectSellingDetailsState>(
          builder: (context, state) {
            DirectSellingDetailsCubit cubit = DirectSellingDetailsCubit.get(context);
            return Center(
              child: Form(
                key: cubit.formKey,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: LocaleKeys.enterQuantity.tr(),
                            textStyle: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: AppColors.darkRed, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          DefaultFormField(
                            fillColor: const Color(0xffF3FCF4),
                            borderRadius: 10,
                            borderColro: AppColors.blue,
                            textInputType: TextInputType.number,
                            controller: cubit.quantityController,
                            hint: LocaleKeys.enterQuantity.tr(),
                            validator: (value) {
                              if (value == null || value.toString().isEmpty) {
                                return LocaleKeys.thisFieldIsRequired.tr();
                              }
                              if (int.parse(value) >
                                  int.parse("${cubit.directSellingDataModel?.subQuantity ?? 0}")) {
                                return LocaleKeys.quantityError.tr();
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          DefaultButton(
                            buttonName: LocaleKeys.done.tr(),
                            loadingColor: AppColors.primaryColor,
                            buttonFunction: () {
                              if (cubit.formKey.currentState!.validate()) {
                                Navigator.pop(context);
                                showTaxBottomSheet(context2,
                                    directSellingcubit: cubit,
                                    cashOnDelivery:
                                        cubit.directSellingDataModel?.availablePaymentOnDelivery ??
                                            0,
                                    price: cubit.directSellingDataModel!.price! *
                                        int.parse(cubit.quantityController.text),
                                    tax: (cubit.directSellingDataModel!.price! -
                                            cubit.directSellingDataModel!.priceAfterTax!) *
                                        int.parse(cubit.quantityController.text),
                                    buttonFunction: () => cubit.buyDirectSelling());
                              }
                            },
                            color: AppColors.red,
                            textColor: Colors.white,
                          ),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.cancel_presentation_outlined,
                            color: AppColors.primaryColor,
                            size: 25.sp,
                          )),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
