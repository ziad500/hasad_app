import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import '../../../../../controller/forget_password_cubit/forget_password_cubit.dart';
import '../components/forget_password3_fileds.dart';
import '../components/forget_password_button3.dart';

class ForgetPassword3 extends StatelessWidget {
  ForgetPassword3({super.key});

  static GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
  static GlobalKey<FormState> formKey4 = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LoadingFrame(
      loadingStates: [
        BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
          builder: (context, state) {
            if (state is ResetPasswordLoadingState) {
              return const LoadingPage();
            }
            return const SizedBox();
          },
        )
      ],
      child: DefaultScaffold(
        backFunction: () => ForgetPasswordCubit.get(context)
            .pageController
            .previousPage(duration: const Duration(milliseconds: 500), curve: Curves.ease),
        back: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                DefaultText(
                  text: LocaleKeys.newPassword.tr(),
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 10.h,
                ),
                DefaultText(
                  text: LocaleKeys.enterNewPassword.tr(),
                  textStyle: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 20.h,
                ),
                ForgetPasswordFields3(
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    formKey3: formKey3,
                    formKey4: formKey4),
                SizedBox(
                  height: 100.h,
                ),
                ForgetPasswordButton3(
                  formKey3: formKey3,
                  formKey4: formKey4,
                  confirmPasswordController: confirmPasswordController,
                  passwordController: passwordController,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
