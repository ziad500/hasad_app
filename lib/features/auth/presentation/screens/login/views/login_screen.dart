import 'package:easy_localization/easy_localization.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/default_text_button.dart';
import 'package:hasad_app/common/logo_widget.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';
import '../../../controller/login_cubit/login_cubit.dart';
import '../components/login_background.dart';
import '../components/login_button.dart';
import '../../../../../../../utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/di.dart' as di;
import '../components/login_form_fileds.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<LoginCubit>(),
      child: DefaultTabController(
        length: 2,
        child: LoginBackGround(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: Column(
              children: [
                SizedBox(height: 250.h, child: const Logo()),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45), topRight: Radius.circular(45)),
                      color: AppColors.scaffoldColor,
                    ),
                    width: double.infinity,
                    child: Form(
                      key: loginFormKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          //  const LoginTabBarWidget(),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: DefaultText(
                                        text: LocaleKeys.login.tr(),
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headlineLarge
                                            ?.copyWith(color: AppColors.primaryColor),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    LoginFormFields(
                                        phoneController: emailController,
                                        passwordController: passwordController),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: DefaultTextButton(
                                        text: LocaleKeys.forgetPassword.tr(),
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context, Routes.forgetPassword);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    LoginButton(
                                        emailController: emailController,
                                        passwordController: passwordController,
                                        formKey: loginFormKey),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: DefaultTextButton(
                                        text: LocaleKeys.noAccount.tr(),
                                        color: AppColors.blue,
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context, Routes.signUpScreenRoutes);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
