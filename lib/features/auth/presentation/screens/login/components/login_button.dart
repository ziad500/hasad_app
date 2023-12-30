import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/show_toast.dart';

import '../../../../../../../utils/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../data/network/auth_requests.dart';
import '../../../controller/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.formKey});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
        } else if (state is InspectorLoginSuccessState) {
          /*   Navigator.pushReplacementNamed(context, Routes.homeRoutes);
              emailController.clear();
              passwordController.clear(); */

          showSnackbar(
              context: context,
              text: AppStrings.loginSuccessfully.tr(),
              state: ToastStates.SUCCESS);
        } else if (state is UserLoginSuccessState) {
          /*  Navigator.pushReplacementNamed(context, Routes.homeRoutes);
            emailController.clear();
            passwordController.clear(); */
          showSnackbar(
              context: context,
              text: AppStrings.loginSuccessfully.tr(),
              state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state) {
        return state is LoginLoadingState
            ? const Center(
                child: LoadingWidget(),
              )
            : DefaultButton(
                buttonName: AppStrings.login.tr(),
                buttonFunction: () {
                  if (formKey.currentState!.validate()) {
                    LoginCubit.get(context)
                        .login(LoginRequest(emailController.text, passwordController.text));
                  }
                });
      },
    );
  }
}
