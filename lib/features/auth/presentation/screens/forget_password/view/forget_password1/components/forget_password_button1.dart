import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/show_toast.dart';

import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../data/network/auth_requests.dart';
import '../../../../../controller/forget_password_cubit/forget_password_cubit.dart';

class ForgetPasswordButton1 extends StatelessWidget {
  const ForgetPasswordButton1({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      buildWhen: (previous, current) => false,
      listener: (context, state) {
        if (state is RequestResetPasswordSuccessState) {
          ForgetPasswordCubit.get(context)
              .pageController
              .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
        } else if (state is RequestResetPasswordErrorState) {
          showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) => DefaultButton(
          buttonName: LocaleKeys.done.tr(),
          buttonFunction: () {
            ForgetPasswordCubit.get(context)
                .pageController
                .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
            if (formKey.currentState!.validate()) {
              ForgetPasswordCubit.get(context).requestResetPasswod(RequestChangePasswordRequest(
                  ForgetPasswordCubit.get(context).emailController.text));
            }
          }),
    );
  }
}
