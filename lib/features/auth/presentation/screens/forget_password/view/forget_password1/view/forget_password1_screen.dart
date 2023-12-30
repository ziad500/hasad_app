import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_form_field.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/icons/call_icon.dart';

import '../../../../../../../../../utils/app_strings.dart';
import '../../../../../../../../../utils/routes_manager.dart';
import '../../../../../../../../../utils/validation.dart';
import '../../../../../controller/forget_password_cubit/forget_password_cubit.dart';
import '../components/forget_password_button1.dart';

class ForgetPassword1 extends StatelessWidget {
  const ForgetPassword1({super.key});
  static GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LoadingFrame(
      loadingStates: [
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
        appbarCenterTitle: true,
        backFunction: () => Navigator.pushReplacementNamed(context, Routes.loginRoutes),
        back: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                DefaultText(
                  text: AppStrings.enterEmailResetPassword.tr(),
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Form(
                  key: formKey,
                  child: DefaultFormField(
                    controller: ForgetPasswordCubit.get(context).emailController,
                    hint: AppStrings.phoneNumber.tr(),
                    prefix: const IconCall(),
                    validator: (value) {
                      if (!validateEmail(value)) {
                        return AppStrings.pleaseEnterValidEmail.tr();
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                ForgetPasswordButton1(
                  formKey: formKey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
