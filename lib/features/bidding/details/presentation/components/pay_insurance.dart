import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/core/func/payment_faild_dialog.dart';
import 'package:hasad_app/features/bidding/details/presentation/controller/cubit/bidding_details_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';

Future payInsuranceDialog(context, {required String text, required BiddingDetailsCubit cubit}) =>
    showDialog(
        context: context,
        builder: (context) => BlocProvider.value(
              value: cubit,
              child: BlocConsumer<BiddingDetailsCubit, BiddingDetailsState>(
                listener: (context, state) {
                  if (state is PayInsuranceBiddingErrorState) {
                    Navigator.pop(context);
                    paymentFaildDialog(context, text: state.error);
                  }
                  if (state is PayInsuranceBiddingSuccessState) {
                    Navigator.pop(context);
                    showSnackbar(
                        context: context,
                        text: LocaleKeys.doneAdd.tr(),
                        state: ToastStates.SUCCESS);
                  }
                },
                builder: (context, state) {
                  BiddingDetailsCubit cubit = BiddingDetailsCubit.get(context);
                  return Dialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(37).w),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  Icon(
                                    Icons.close,
                                    color: AppColors.darkBlue,
                                    size: 50.sp,
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  DefaultText(
                                    text: "تأمين المزاد",
                                    textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: AppColors.darkBlue, fontWeight: FontWeight.w900),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  DefaultText(
                                    text: text,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: AppColors.primaryColor),
                                  ),
                                  const Spacer(),
                                  DefaultButton(
                                    buttonName: "دفع التأمين",
                                    buttonFunction: () => cubit.payInsurance(),
                                    color: AppColors.red,
                                    isLoading: state is PayInsuranceBiddingLoadingState,
                                    textColor: Colors.white,
                                    loadingColor: AppColors.primaryColor,
                                    icon: SvgPicture.asset(SVGManager.wallet),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  )
                                ],
                              ),
                            ),
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
                  );
                },
              ),
            ));
