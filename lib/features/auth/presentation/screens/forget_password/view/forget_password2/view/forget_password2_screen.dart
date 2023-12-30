import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/core/timer/cubit/presentation/timer_view.dart';
import 'package:hasad_app/utils/app_colors.dart';

import '../../../../../../../../../utils/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../controller/forget_password_cubit/forget_password_cubit.dart';
import '../components/forget_password_button2.dart';
import '../components/row_of_code_fields.dart';

class ForgetPassword2 extends StatelessWidget {
  ForgetPassword2({super.key});
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
        BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
          builder: (context, state) {
            if (state is VerifyOtpLoadingState) {
              return const LoadingPage();
            }
            return const SizedBox();
          },
        ),
        BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
          builder: (context, state) {
            if (state is RequestResetPasswordLoadingState) {
              return const LoadingPage();
            }
            return const SizedBox();
          },
        )
      ],
      child: DefaultScaffold(
        back: true,
        backFunction: () => ForgetPasswordCubit.get(context)
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
                  text: AppStrings.enterVerificationCode.tr(),
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 10.h,
                ),
                DefaultText(
                  text: "تم ارسال رمز تأكيد الي رقم الجوال الخاص بك",
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
                BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
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
                ForgetPasswordButton2(
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
