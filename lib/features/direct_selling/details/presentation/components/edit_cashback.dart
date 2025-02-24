import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_form_field.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/common/quantity_button_widget.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/controller/cubit/direct_selling_details_cubit.dart';
import 'package:hasad_app/features/profile/presentation/controller/cubit/profile_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';

Future showCashBackBottomSheet(
  context, {
  DirectSellingDetailsCubit? cubit,
}) =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(.8),
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      builder: (context) => Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20)
            .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: SingleChildScrollView(
          child: BlocProvider.value(
            value: cubit!,
            child: BlocConsumer<DirectSellingDetailsCubit, DirectSellingDetailsState>(
              listener: (context, state) {
                if (state is EditCashBackSuccessState) {
                  Navigator.pop(context);
                  showSnackbar(
                      context: context,
                      text: LocaleKeys.doneEdited.tr(),
                      state: ToastStates.SUCCESS);

                  //cubit.getDirectSellingDetails(cubit.directSellingDataModel!.id.toString());
                }
                if (state is EditCashBackErrorState) {
                  Navigator.pop(context);
                  showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
                }
              },
              builder: (context, state) {
                DirectSellingDetailsCubit cubit = DirectSellingDetailsCubit.get(context);
                return Center(
                  child: Form(
                    key: cubit.cashBackFormKey,
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
                                text: LocaleKeys.cashBack.tr(),
                                textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.darkRed, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              DefaultFormField(
                                fillColor: const Color(0xffF3FCF4),
                                borderRadius: 10,
                                prefix: QuantityButtonWidget(
                                    isIncrement: true,
                                    onTap: () {
                                      final currentValue =
                                          double.tryParse(cubit.cashBackController.text.trim()) ??
                                              0.0;
                                      final increment = ProfileCubit.get(context)
                                              .settingsDataModel
                                              ?.cashbackRateIncrement ??
                                          1.0;
                                      cubit.cashBackController.text =
                                          (currentValue + increment).toInt().toString();
                                    }),
                                suffix: QuantityButtonWidget(
                                    isIncrement: false,
                                    onTap: () {
                                      final currentValue =
                                          double.tryParse(cubit.cashBackController.text.trim()) ??
                                              0.0;
                                      final increment = ProfileCubit.get(context)
                                              .settingsDataModel
                                              ?.cashbackRateIncrement ??
                                          1.0;
                                      cubit.cashBackController.text =
                                          (currentValue - increment).toInt().toString();
                                    }),
                                borderColro: AppColors.blue,
                                textAlign: TextAlign.center,
                                maxLength: 2,
                                textInputType: TextInputType.number,
                                controller: cubit.cashBackController,
                                hint: LocaleKeys.cashBack.tr(),
                                validator: (value) {
                                  if (value == null || value.toString().isEmpty) {
                                    return LocaleKeys.thisFieldIsRequired.tr();
                                  }
                                  if (int.parse(value) > int.parse("90")) {
                                    return LocaleKeys.cashbackError.tr();
                                  }
                                  if (double.tryParse(value)! <= 0) {
                                    return Constants.isArabic
                                        ? "يجب ان تكون قيمه الكاش باك بين 0 و 90"
                                        : "The cashback value must be between 0 and 90.";
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
                                isLoading: state is EditCashBackLoadingState,
                                buttonFunction: () {
                                  if (cubit.cashBackFormKey.currentState!.validate()) {
                                    cubit.editCashBack();

                                    /*  showTaxBottomSheet(context2,
                                        price: cubit.directSellingDataModel!.price! *
                                            int.parse(cubit.quantityController.text),
                                        tax: (cubit.directSellingDataModel!.price! -
                                                cubit.directSellingDataModel!.priceAfterTax!) *
                                            int.parse(cubit.quantityController.text),
                                        buttonFunction: () => cubit.buyDirectSelling()); */
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
        ),
      ),
    );
