import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_divider.dart';
import 'package:hasad_app/common/default/default_form_field.dart';
import 'package:hasad_app/common/icons/call_icon.dart';
import 'package:hasad_app/utils/app_assets.dart';
import '../../../../../../../utils/app_strings.dart';
import '../../../../../../../utils/validation.dart';
import '../../../controller/login_cubit/login_cubit.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields(
      {super.key, required this.phoneController, required this.passwordController});
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10).w,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).w,
            child: DefaultFormField(
              controller: phoneController,
              hint: "966+",
              prefix: const IconCall(),
              validator: (value) {
                if (!validateEmail(value)) {
                  return AppStrings.pleaseEnterValidEmail.tr();
                }
                return null;
              },
            ),
          ),
          const DefaultDivider(indent: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).w,
            child: BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) => current is ViewPasswordState,
              builder: (context, state) {
                return DefaultFormField(
                  controller: passwordController,
                  hint: AppStrings.password.tr(),
                  prefix: SvgPicture.asset(SVGManager.lock),
                  validator: (value) {
                    return null;
                  },
                  obscureText: LoginCubit.get(context).obscured,
                  onSuffixTap: () => LoginCubit.get(context).toggleObscured(),
                  suffix: LoginCubit.get(context).suffix,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
