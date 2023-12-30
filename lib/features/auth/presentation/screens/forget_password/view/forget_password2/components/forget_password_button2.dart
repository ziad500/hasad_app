import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/show_toast.dart';

import 'package:hasad_app/generated/app_strings.g.dart';
import '../../../../../../data/network/auth_requests.dart';
import '../../../../../controller/forget_password_cubit/forget_password_cubit.dart';

class ForgetPasswordButton2 extends StatelessWidget {
  const ForgetPasswordButton2(
      {super.key,
      required this.code1Controller,
      required this.code2Controller,
      required this.code3Controller,
      required this.code4Controller});
  final TextEditingController code1Controller;
  final TextEditingController code2Controller;
  final TextEditingController code3Controller;
  final TextEditingController code4Controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      buildWhen: (previous, current) => false,
      listener: (context, state) {
        if (state is VerifyOtpErrorState) {
          showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
        } else if (state is VerifyOtpSuccessState) {
          ForgetPasswordCubit.get(context)
              .pageController
              .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
        } else if (state is RequestResetPasswordSuccessState) {
          showSnackbar(
              context: context, text: LocaleKeys.codeSent.tr(), state: ToastStates.SUCCESS);
        } else if (state is RequestResetPasswordErrorState) {
          showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) => DefaultButton(
          buttonName: LocaleKeys.confirm.tr(),
          buttonFunction: () {
            ForgetPasswordCubit.get(context)
                .pageController
                .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
            if (code1Controller.text != "" ||
                code2Controller.text != "" ||
                code3Controller.text != "" ||
                code4Controller.text != "") {
              ForgetPasswordCubit.get(context).verifyOtp(VerifyOtpRequest(
                  ForgetPasswordCubit.get(context).emailController.text,
                  code1Controller.text +
                      code2Controller.text +
                      code3Controller.text +
                      code4Controller.text));
            } else {
              showSnackbar(
                  context: context,
                  text: LocaleKeys.pleaseEnterValidCode.tr(),
                  state: ToastStates.ERROR);
            }
          }),
    );
  }
}
