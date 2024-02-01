import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/services/firebase_messaging_service.dart';
import 'package:hasad_app/utils/cache_helper.dart';
import 'package:hasad_app/utils/cache_keys.dart';

import '../../../../../../../../utils/routes_manager.dart';
import '../../../../../data/network/auth_requests.dart';
import '../../../../controller/signup/user/sign_up_cubit.dart';

class UserSignupButton extends StatelessWidget {
  const UserSignupButton({super.key, required this.formKey, required this.userSignUpRequest});
  final GlobalKey<FormState> formKey;
  final UserSignUpRequest userSignUpRequest;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserSignUpCubit, UserSignUpState>(listener: (context, state) {
      if (state is UserSignUpErrorState) {
        showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
      }
      if (state is UserSignUpSuccessState) {
        Navigator.pushNamed(context, Routes.homeScreenRoutes);
        showSnackbar(
            context: context, text: LocaleKeys.signUpSuccess.tr(), state: ToastStates.SUCCESS);
      }
    }, builder: (context, state) {
      UserSignUpCubit cubit = UserSignUpCubit.get(context);
      return state is UserSignUpLoadingState
          ? const LoadingWidget()
          : DefaultButton(
              borderRAdius: 43,
              buttonName: LocaleKeys.newRegister.tr(),
              buttonFunction: () async {
                userSignUpRequest.deviceToken = await FirebaseMessagingService.getToken() ?? "";
                CacheHelper.saveData(key: CacheKeys.fcmId, value: userSignUpRequest.deviceToken);
                if (formKey.currentState!.validate()) {
                  await cubit.userSignup(userSignUpRequest);
                }
              });
    });
  }
}
