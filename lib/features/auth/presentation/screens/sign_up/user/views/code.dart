import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/core/timer/cubit/presentation/timer_view.dart';
import 'package:hasad_app/features/auth/presentation/controller/signup/user/sign_up_cubit.dart';
import 'package:hasad_app/features/auth/presentation/screens/forget_password/view/forget_password2/components/row_of_code_fields.dart';
import 'package:hasad_app/features/auth/presentation/screens/sign_up/user/components/verify_code_button.dart';
import 'package:hasad_app/utils/app_colors.dart';

import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpCode extends StatelessWidget {
  SignUpCode({super.key});
  final TextEditingController code1Controller = TextEditingController();
  final TextEditingController code2Controller = TextEditingController();
  final TextEditingController code3Controller = TextEditingController();
  final TextEditingController code4Controller = TextEditingController();
  final TextEditingController code5Controller = TextEditingController();
  final TextEditingController code6Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LoadingFrame(
      loadingStates: [
        BlocBuilder<UserSignUpCubit, UserSignUpState>(
          builder: (context, state) {
            if (state is VerifyOtpLoadingState) {
              return const LoadingPage();
            }
            return const SizedBox();
          },
        ),
        /*   BlocBuilder<UserSignUpCubit, UserSignUpState>(
          builder: (context, state) {
            if (state is RequestResetPasswordLoadingState) {
              return const LoadingPage();
            }
            return const SizedBox();
          },
        ) */
      ],
      child: DefaultScaffold(
        back: true,
        backFunction: () => UserSignUpCubit.get(context)
            .pageController
            .previousPage(duration: const Duration(milliseconds: 500), curve: Curves.ease),
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
                  text: LocaleKeys.enterVerificationCode.tr(),
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 10.h,
                ),
                DefaultText(
                  text: LocaleKeys.verificationCodeSent.tr(),
                  textStyle: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 40.h,
                ),
                RowOfCodesFields(
                    code1Controller: code1Controller,
                    code2Controller: code2Controller,
                    code3Controller: code3Controller,
                    code4Controller: code4Controller),
                SizedBox(
                  height: 40.h,
                ),
                TimeObject(
                    date: DateTime.now().add(const Duration(minutes: 1)).toString(),
                    onPressed: () {}),
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<UserSignUpCubit, UserSignUpState>(
                  builder: (context, state) {
                    if (state is VerifyOtpErrorState) {
                      return DefaultText(
                        text: state.error,
                        textStyle: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: AppColors.yellow),
                      );
                    }
                    return const SizedBox();
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                VerifySignupCodeButton(
                    code1Controller: code1Controller,
                    code2Controller: code2Controller,
                    code3Controller: code3Controller,
                    code4Controller: code4Controller)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
