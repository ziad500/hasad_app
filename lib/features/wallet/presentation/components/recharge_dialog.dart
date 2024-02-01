import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_form_field.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/common/done_request_screen.dart';
import 'package:hasad_app/features/wallet/presentation/controller/cubit/wallet_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/routes_manager.dart';
import 'package:hasad_app/utils/validation.dart';

Future rechargeDialog(context,
        {String? text, required WalletCubit walletCubit, bool fromStc = false}) =>
    showDialog(
        context: context,
        builder: (context) => BlocProvider.value(
              value: walletCubit,
              child: BlocConsumer<WalletCubit, WalletState>(
                listener: (context, state) {
                  if (state is BankRechargSuccessState) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoneRequestScreen(
                                donePageState: DonePageState.done,
                                title: LocaleKeys.donePayment.tr(),
                                subTitle: state.successModel.message ?? "",
                                route: Routes.homeScreenRoutes)),
                        (route) => false);
                  }
                  if (state is GetPaymentLinkSuccessState) {
                    Navigator.pushNamed(context, Routes.paymentRoutes, arguments: {
                      "url": state.stchRechargeModel.url,
                      "value": WalletCubit.get(context).valueContoller.text,
                      "cubit": WalletCubit.get(context)
                    });
                  }
                  if (state is BankRechargErrorState) {
                    showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
                  }
                  if (state is GetPaymentLinkErrorState) {
                    showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
                  }
                },
                builder: (context, state) {
                  WalletCubit cubit = WalletCubit.get(context);
                  return Dialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22).w),
                    child: Form(
                      key: cubit.globalKey,
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
                                  text: LocaleKeys.rechargeCard.tr(),
                                  textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppColors.blue, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                DefaultFormField(
                                    fillColor: const Color(0xffF3FCF4),
                                    borderRadius: 10,
                                    borderColro: AppColors.blue,
                                    controller: cubit.valueContoller,
                                    hint: LocaleKeys.enterNewPrice.tr(),
                                    validator: defaultValidation),
                                SizedBox(
                                  height: 20.h,
                                ),
                                DefaultButton(
                                  buttonName: LocaleKeys.recharge.tr(),
                                  loadingColor: AppColors.primaryColor,
                                  isLoading: state is BankRechargLoadingState ||
                                      state is GetPaymentLinkLoadingState,
                                  buttonFunction: () {
                                    if (cubit.globalKey.currentState!.validate()) {
                                      if (fromStc) {
                                        cubit.getPaymentLink();
                                      } else {
                                        cubit.bankRecharge();
                                      }
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
            ));
