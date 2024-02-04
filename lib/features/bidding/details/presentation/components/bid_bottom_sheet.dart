import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_form_field.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/common/shared_bottom_sheet.dart';
import 'package:hasad_app/core/func/payment_faild_dialog.dart';
import 'package:hasad_app/features/bidding/details/presentation/components/pay_insurance.dart';
import 'package:hasad_app/features/bidding/details/presentation/controller/cubit/bidding_details_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/validation.dart';

Future showBidBottomSheet(context, {BiddingDetailsCubit? cubit}) => defaultshowModalBottomSheet(
      context: context,
      withHeader: false,
      child: BlocProvider.value(
        value: cubit!,
        child: BlocConsumer<BiddingDetailsCubit, BiddingDetailsState>(
          listener: (context, state) {
            if (state is BidBiddingErrorState) {
              BiddingDetailsCubit.get(context).valueController.clear();
              Navigator.pop(context);
              if (state.error.contains("insurance")) {
                payInsuranceDialog(context,
                    text: state.error.replaceAll("insurance", ""), cubit: cubit);
              } else {
                paymentFaildDialog(context, text: state.error);
              }
            }
            if (state is BidBiddingSuccessState) {
              BiddingDetailsCubit.get(context).valueController.clear();
              Navigator.pop(context);
              showSnackbar(
                  context: context, text: LocaleKeys.doneAdd.tr(), state: ToastStates.SUCCESS);
            }
          },
          builder: (context, state) {
            BiddingDetailsCubit cubit = BiddingDetailsCubit.get(context);
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
                            text: LocaleKeys.bidNow.tr(),
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
                              controller: cubit.valueController,
                              hint: LocaleKeys.bidNow.tr(),
                              validator: defaultValidation),
                          SizedBox(
                            height: 20.h,
                          ),
                          DefaultButton(
                            buttonName: LocaleKeys.done.tr(),
                            loadingColor: AppColors.primaryColor,
                            isLoading: state is BidBiddingLoadingState,
                            buttonFunction: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.bid();
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
