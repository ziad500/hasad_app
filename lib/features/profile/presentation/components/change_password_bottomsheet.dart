import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_form_field.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/profile/presentation/controller/change_password/change_password_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/validation.dart';

class ChangePasswordBottomSheet extends StatelessWidget {
  const ChangePasswordBottomSheet({super.key});
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ChangePasswordCubit>(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordErrorState) {
            showSnackbar(
                context: context,
                text: state.error,
                state: ToastStates.ERROR,
                gravity: ToastGravity.TOP);
          }
          if (state is ChangePasswordSuccessState) {
            Navigator.pop(context);
            showSnackbar(
                context: context, text: LocaleKeys.doneEdited.tr(), state: ToastStates.SUCCESS);
          }
        },
        builder: (context, state) {
          ChangePasswordCubit cubit = ChangePasswordCubit.get(context);
          return Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: LocaleKeys.changePassword.tr(),
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                DefaultFormField(
                    controller: cubit.oldPasswordController,
                    hint: LocaleKeys.oldPassword.tr(),
                    suffix: cubit.oldSuffix,
                    obscureText: cubit.oldObscured,
                    onSuffixTap: () => cubit.toggleOldObscured(),
                    validator: defaultValidation),
                const SizedBox(
                  height: 16,
                ),
                DefaultFormField(
                    controller: cubit.passwordController,
                    hint: LocaleKeys.password.tr(),
                    suffix: cubit.suffix,
                    obscureText: cubit.obscured,
                    onSuffixTap: () => cubit.toggleObscured(),
                    validator: defaultPasswordValidation),
                const SizedBox(
                  height: 16,
                ),
                DefaultFormField(
                    controller: cubit.passwordConfirmationController,
                    hint: LocaleKeys.confirmPassword.tr(),
                    suffix: cubit.confirmSuffix,
                    obscureText: cubit.confirmObscured,
                    onSuffixTap: () => cubit.confirmToggleObscured(),
                    validator: (value) {
                      if (value.isEmpty) {
                        return LocaleKeys.thisFieldIsRequired.tr();
                      } else if (value != cubit.passwordController.text) {
                        return LocaleKeys.passwordNotMatched.tr();
                      }
                      if (!validatePassword(value)) {
                        return LocaleKeys.pleaseEnterAValidPassword.tr();
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                DefaultButton(
                    buttonName: LocaleKeys.done.tr(),
                    isLoading: state is ChangePasswordLoadingState,
                    buttonFunction: () {
                      if (formKey.currentState!.validate()) {
                        cubit.changePassword();
                      }
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
