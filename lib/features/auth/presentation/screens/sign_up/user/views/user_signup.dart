import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/default/default_form_field.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/default_text_button.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/icons/call_icon.dart';
import 'package:hasad_app/common/logo_widget.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/di.dart' as di;
import 'package:hasad_app/generated/app_strings.g.dart';
import '../../../../../../../../utils/routes_manager.dart';
import '../../../../../../../../utils/validation.dart';
import '../../../../../data/network/auth_requests.dart';
import '../../../../controller/signup/user/sign_up_cubit.dart';
import '../components/user_sign_up_button.dart';

class UserSignUp extends StatelessWidget {
  const UserSignUp({super.key});
  static TextEditingController nameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController stcController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController addressController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController = TextEditingController();
  static TextEditingController regionController = TextEditingController();
  static TextEditingController cityController = TextEditingController();
  static TextEditingController districtController = TextEditingController();
  static GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<UserSignUpCubit>(),
      child: DefaultScaffold(
        backFunction: () =>
            Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoutes, (route) => false),
        back: true,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: SizedBox(height: 100.h, child: const Logo())),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: DefaultText(
                            text: LocaleKeys.newRegister.tr(),
                            textStyle: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        DefaultFormField(
                            controller: nameController,
                            hint: LocaleKeys.username.tr(),
                            prefix: SvgPicture.asset(SVGManager.user),
                            validator: defaultValidation),
                        SizedBox(
                          height: 10.h,
                        ),
                        DefaultFormField(
                            controller: phoneController,
                            hint: LocaleKeys.phoneNumber.tr(),
                            prefix: const IconCall(),
                            validator: defaultPhoneNumberValidation),
                        SizedBox(
                          height: 10.h,
                        ),
                        DefaultFormField(
                            controller: stcController,
                            hint: LocaleKeys.yourStcNumber.tr(),
                            prefix: SvgPicture.asset(SVGManager.circle),
                            validator: defaultStcValidation),
                        SizedBox(
                          height: 10.h,
                        ),
                        BlocBuilder<UserSignUpCubit, UserSignUpState>(
                          buildWhen: (previous, current) => current is ViewPasswordState,
                          builder: (context, state) {
                            return DefaultFormField(
                              controller: passwordController,
                              prefix: SvgPicture.asset(SVGManager.lock),
                              obscureText: UserSignUpCubit.get(context).obscured,
                              onSuffixTap: () => UserSignUpCubit.get(context).toggleObscured(),
                              suffix: UserSignUpCubit.get(context).suffix,
                              hint: LocaleKeys.password.tr(),
                              validator: (value) {
                                if (!validatePassword(value)) {
                                  return LocaleKeys.pleaseEnterAValidPassword.tr();
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        BlocBuilder<UserSignUpCubit, UserSignUpState>(
                          buildWhen: (previous, current) => current is ConfirmViewPasswordState,
                          builder: (context, state) {
                            return DefaultFormField(
                              prefix: SvgPicture.asset(SVGManager.lock),
                              controller: confirmPasswordController,
                              obscureText: UserSignUpCubit.get(context).confirmObscured,
                              onSuffixTap: () =>
                                  UserSignUpCubit.get(context).confirmToggleObscured(),
                              suffix: UserSignUpCubit.get(context).confirmSuffix,
                              hint: LocaleKeys.retypePassword.tr(),
                              validator: (value) {
                                if (value != passwordController.text) {
                                  return LocaleKeys.passwordNotMatched.tr();
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        UserSignupButton(
                            formKey: formkey,
                            userSignUpRequest: UserSignUpRequest(
                                name: nameController.text,
                                phone: int.tryParse(phoneController.text) ?? 0,
                                stc: int.tryParse(stcController.text) ?? 0,
                                password: passwordController.text,
                                passwordConfirmation: confirmPasswordController.text)),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: DefaultTextButton(
                            text: LocaleKeys.alreadyHaveAccount.tr(),
                            color: AppColors.blue,
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, Routes.signUpScreenRoutes);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
