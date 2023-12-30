import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/show_toast.dart';

import '../../../../../../../../../utils/app_strings.dart';
import '../../../../../../../../../utils/routes_manager.dart';
import '../../../../../../data/network/auth_requests.dart';
import '../../../../../controller/forget_password_cubit/forget_password_cubit.dart';

class ForgetPasswordButton3 extends StatelessWidget {
  const ForgetPasswordButton3(
      {super.key,
      required this.formKey3,
      required this.formKey4,
      required this.confirmPasswordController,
      required this.passwordController});
  final GlobalKey<FormState> formKey3;
  final GlobalKey<FormState> formKey4;
  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      buildWhen: (previous, current) => false,
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          Navigator.pushReplacementNamed(context, Routes.loginRoutes);
          showSnackbar(context: context, text: state.successMessgae, state: ToastStates.SUCCESS);
        } else if (state is ResetPasswordErrorState) {
          showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) => DefaultButton(
          buttonName: AppStrings.done.tr(),
          buttonFunction: () {
            if (formKey3.currentState!.validate() && formKey4.currentState!.validate()) {
              ForgetPasswordCubit.get(context).resetPasswod(ResetPasswordRequest(
                  confirmPasswordController.text,
                  passwordController.text,
                  ForgetPasswordCubit.get(context).emailController.text));
            }
          }),
    );
  }
}
