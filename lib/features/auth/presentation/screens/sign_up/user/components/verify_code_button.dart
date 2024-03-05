import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import '../../../../../../../utils/routes_manager.dart';
import '../../../../controller/signup/user/sign_up_cubit.dart';

class VerifySignupCodeButton extends StatelessWidget {
  const VerifySignupCodeButton(
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
    return BlocConsumer<UserSignUpCubit, UserSignUpState>(listener: (context, state) {
      if (state is VerifyOtpErrorState) {
        showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
      }
      if (state is VerifyOtpSuccessState) {
        Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreenRoutes, (route) => false);
        showSnackbar(
            context: context, text: LocaleKeys.signUpSuccess.tr(), state: ToastStates.SUCCESS);
      }
    }, builder: (context, state) {
      UserSignUpCubit cubit = UserSignUpCubit.get(context);
      return state is UserSignUpLoadingState
          ? const LoadingWidget()
          : DefaultButton(
              borderRAdius: 43,
              buttonName: LocaleKeys.newRegister.tr(),
              buttonFunction: () async {
                if (code1Controller.text != "" ||
                    code2Controller.text != "" ||
                    code3Controller.text != "" ||
                    code4Controller.text != "") {
                  await cubit.verifySignupCode(code1Controller.text +
                      code2Controller.text +
                      code3Controller.text +
                      code4Controller.text);
                } else {
                  showSnackbar(
                      context: context,
                      text: LocaleKeys.pleaseEnterValidCode.tr(),
                      state: ToastStates.ERROR);
                }
              });
    });
  }
}
