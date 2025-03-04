import 'dart:developer';

import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/features/favorites/presentation/controller/cubit/favorites_cubit.dart';
import 'package:hasad_app/features/layout/cubit/layout_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:hasad_app/services/firebase_messaging_service.dart';
import 'package:hasad_app/utils/cache_helper.dart';
import 'package:hasad_app/utils/cache_keys.dart';
import 'package:hasad_app/utils/routes_manager.dart';

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
        } else if (state is UserLoginSuccessState) {
          LayoutCubit.get(context).changeScreen(0);
          FavoritesCubit.get(context).getFavoritesList();
          Navigator.pushReplacementNamed(context, Routes.homeScreenRoutes);
          emailController.clear();
          passwordController.clear();
          showSnackbar(
              context: context,
              text: LocaleKeys.loginSuccessfully.tr(),
              state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return state is LoginLoadingState
            ? const Center(
                child: LoadingWidget(),
              )
            : DefaultButton(
                borderRAdius: 43,
                buttonName: LocaleKeys.login.tr(),
                buttonFunction: () async {
                  try {
                    cubit.emitLoginLoading();
                    String? fcmToken = await FirebaseMessagingService.getToken();
                    CacheHelper.saveData(key: CacheKeys.fcmId, value: fcmToken);

                    if (formKey.currentState!.validate()) {
                      await cubit.login(LoginRequest(
                          emailController.text, passwordController.text, fcmToken ?? "00"));
                    }
                  } catch (e) {
                    if (formKey.currentState!.validate()) {
                      await cubit.login(
                          LoginRequest(emailController.text, passwordController.text, "000"));
                    }
                    log(e.toString());
                  }
                });
      },
    );
  }
}
