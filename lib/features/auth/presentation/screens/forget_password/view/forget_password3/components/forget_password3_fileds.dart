import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_form_field.dart';
import 'package:hasad_app/utils/app_assets.dart';

import '../../../../../../../../../utils/app_strings.dart';
import '../../../../../../../../../utils/validation.dart';
import '../../../../../controller/forget_password_cubit/forget_password_cubit.dart';

class ForgetPasswordFields3 extends StatelessWidget {
  const ForgetPasswordFields3(
      {super.key,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.formKey3,
      required this.formKey4});
  final GlobalKey<FormState> formKey3;
  final GlobalKey<FormState> formKey4;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  @override
  build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
          buildWhen: (previous, current) => current is ViewPasswordState,
          builder: (context, state) {
            return Form(
              key: formKey3,
              child: DefaultFormField(
                controller: passwordController,
                prefix: SvgPicture.asset(SVGManager.lock),
                obscureText: ForgetPasswordCubit.get(context).obscured,
                onSuffixTap: () => ForgetPasswordCubit.get(context).toggleObscured(),
                suffix: ForgetPasswordCubit.get(context).suffix,
                hint: "كلمة المرور الجديدة",
                onChanged: (p0) {
                  if (confirmPasswordController.text != "") {
                    formKey4.currentState?.validate();
                  }
                },
                validator: (value) {
                  if (!validatePassword(value)) {
                    return AppStrings.pleaseEnterAValidPassword.tr();
                  }
                  return null;
                },
              ),
            );
          },
        ),
        const SizedBox(
          height: 16,
        ),
        BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
          buildWhen: (previous, current) => current is ConfirmViewPasswordState,
          builder: (context, state) {
            return Form(
              key: formKey4,
              child: DefaultFormField(
                prefix: SvgPicture.asset(SVGManager.lock),
                controller: confirmPasswordController,
                obscureText: ForgetPasswordCubit.get(context).confirmObscured,
                onSuffixTap: () => ForgetPasswordCubit.get(context).confirmToggleObscured(),
                suffix: ForgetPasswordCubit.get(context).confirmSuffix,
                hint: "إعادة كتابة كلمة المرور الجديدة",
                validator: (value) {
                  if (value != passwordController.text) {
                    return AppStrings.passwordNotMatched.tr();
                  }
                  return null;
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
