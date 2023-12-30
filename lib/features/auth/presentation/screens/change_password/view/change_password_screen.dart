/* import 'package:adeal_app/common/deafult/loading_frame.dart';
import 'package:adeal_app/common/deafult/loading_page.dart';
import 'package:adeal_app/common/deafult/main_layout.dart';
import 'package:adeal_app/common/deafult/show_toast.dart';
import 'package:adeal_app/features/user/auth/data/network/auth_requests.dart';
import 'package:adeal_app/features/user/auth/presentation/controller/change_password/change_password_cubit.dart';
import 'package:adeal_app/utils/app_strings.dart';
import 'package:adeal_app/utils/cache_helper.dart';
import 'package:adeal_app/utils/cache_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  static GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<ChangePasswordCubit>(),
      child: LoadingFrame(
        loadingStates: [
          BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
            builder: (context, state) {
              if (state is ChangePasswordLoadingState) {
                return const LoadingPage();
              }
              return const SizedBox();
            },
          )
        ],
        child: DefaultScaffold(
            back: true,
            appbarTitle: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Text(
                AppStrings.resetPassword.tr(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            appbaractions: [
              BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                buildWhen: (previous, current) => false,
                listener: (context, state) {
                  if (state is ChangePasswordErrorState) {
                    showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
                  } else if (state is ChangePasswordSuccessState) {
                    CacheHelper.saveData(key: CacheKeys.password, value: passwordController.text);
                    Navigator.pop(context);
                    showSnackbar(
                        context: context,
                        text: AppStrings.doneEdited.tr(),
                        state: ToastStates.SUCCESS);
                  }
                },
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        if (formKey.currentState!.validate() &&
                            formKey2.currentState!.validate() &&
                            formKey3.currentState!.validate()) {
                          ChangePasswordCubit.get(context).changePasswod(ChangePasswordRequest(
                              confirmPasswordController.text,
                              passwordController.text,
                              oldPasswordController.text));
                        }
                      },
                      icon: const Icon(
                        Icons.done,
                        color: Colors.white,
                      ));
                },
              )
            ],
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    FadeAnimation(
                        child: Text("Old Password",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16))),
                    const SizedBox(
                      height: 5,
                    ),
                    BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                      buildWhen: (previous, current) => current is OldViewPasswordState,
                      builder: (context, state) {
                        return Form(
                          key: formKey3,
                          child: DefaultFormField(
                            controller: oldPasswordController,
                            obscureText: ChangePasswordCubit.get(context).oldObscured,
                            onSuffixTap: () => ChangePasswordCubit.get(context).toggleOldObscured(),
                            suffix: ChangePasswordCubit.get(context).oldSuffix,
                            hint: AppStrings.currentPassword.tr(),
                            validator: (value) {
                              if (value !=
                                  CacheHelper.getData(key: CacheKeys.password).toString()) {
                                return AppStrings.oldPasswordIncorrect.tr();
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
                    FadeAnimation(
                        child: Text(AppStrings.newPassword.tr(),
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16))),
                    const SizedBox(
                      height: 5,
                    ),
                    BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                      buildWhen: (previous, current) => current is ViewPasswordState,
                      builder: (context, state) {
                        return Form(
                          key: formKey,
                          child: DefaultFormField(
                            controller: passwordController,
                            obscureText: ChangePasswordCubit.get(context).obscured,
                            onSuffixTap: () => ChangePasswordCubit.get(context).toggleObscured(),
                            suffix: ChangePasswordCubit.get(context).suffix,
                            hint: AppStrings.newPassword.tr(),
                            onChanged: (p0) {
                              if (confirmPasswordController.text != "") {
                                formKey2.currentState?.validate();
                              }
                            },
                            validator: (value) {
                              if (value ==
                                  CacheHelper.getData(key: CacheKeys.password).toString()) {
                                return AppStrings.oldNewPasswordError.tr();
                              } else if (!validatePassword(value)) {
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
                    FadeAnimation(
                        child: Text(AppStrings.confirmPassword.tr(),
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16))),
                    const SizedBox(
                      height: 5,
                    ),
                    BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                      buildWhen: (previous, current) => current is ConfirmViewPasswordState,
                      builder: (context, state) {
                        return Form(
                          key: formKey2,
                          child: DefaultFormField(
                            controller: confirmPasswordController,
                            obscureText: ChangePasswordCubit.get(context).confirmObscured,
                            onSuffixTap: () =>
                                ChangePasswordCubit.get(context).confirmToggleObscured(),
                            suffix: ChangePasswordCubit.get(context).confirmSuffix,
                            hint: AppStrings.confirmPassword.tr(),
                            validator: (value) {
                              if (value != passwordController.text) {
                                return AppStrings.passwordNotMatched.tr();
                              }
                              if (!validatePassword(value)) {
                                return AppStrings.pleaseEnterAValidPassword.tr();
                              }
                              return null;
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
 */