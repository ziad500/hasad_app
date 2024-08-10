import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/auth/domain/usecase/resend_signup_code_usecase.dart';
import 'package:hasad_app/features/auth/domain/usecase/verify_signup_code_usecase.dart';
import 'package:hasad_app/features/auth/presentation/screens/sign_up/user/views/code.dart';
import 'package:hasad_app/features/auth/presentation/screens/sign_up/user/views/user_signup.dart';

import '../../../../../../../core/constants.dart';
import '../../../../../../../utils/app_colors.dart';
import '../../../../../../../utils/cache_helper.dart';
import '../../../../../../../utils/cache_keys.dart';
import '../../../../data/network/auth_requests.dart';
import '../../../../domain/models/login_model.dart';
import '../../../../domain/usecase/user_signup_usecase.dart';

part 'sign_up_state.dart';

class UserSignUpCubit extends Cubit<UserSignUpState> {
  final UserSignUpUseCase userSignUpUseCase;
  final VerifySignupOtpUseCase _verifySignupOtpUseCase;
  final ResendSignupCodeUseCase _resendSignupCodeUseCase;
  UserSignUpCubit(
      this.userSignUpUseCase, this._verifySignupOtpUseCase, this._resendSignupCodeUseCase)
      : super(SignUpInitial());

  static UserSignUpCubit get(context) => BlocProvider.of(context);
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  int pageNumber = 0;
  void changepageViewIndex(int index) {
    pageNumber = index;
    emit(ChangePAgeViewIndexState());
  }

  List<Widget> screens = [const UserSignUp(), SignUpCode()];

  PageController pageController = PageController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  Icon suffix = const Icon(
    Icons.remove_red_eye,
    color: AppColors.iconColor,
  );
  bool obscured = true;
  // function to toggle between password icon
  void toggleObscured() {
    obscured = !obscured;

    if (obscured) {
      suffix = const Icon(
        Icons.remove_red_eye,
        color: AppColors.iconColor,
      );
    } else {
      suffix = const Icon(
        Icons.visibility_off,
        color: AppColors.iconColor,
      );
    }
    emit(ViewPasswordState());
  }

  Icon confirmSuffix = const Icon(
    Icons.remove_red_eye,
    color: AppColors.iconColor,
  );

  bool confirmObscured = true;
  // function to toggle between password icon
  void confirmToggleObscured() {
    confirmObscured = !confirmObscured;

    if (confirmObscured) {
      confirmSuffix = const Icon(
        Icons.remove_red_eye,
        color: AppColors.iconColor,
      );
    } else {
      confirmSuffix = const Icon(
        Icons.visibility_off,
        color: AppColors.iconColor,
      );
    }
    emit(ConfirmViewPasswordState());
  }

  Future<void> userSignup(UserSignUpRequest userSignUpRequest) async {
    emit(UserSignUpLoadingState());
    await userSignUpUseCase.execude(userSignUpRequest).then((value) => value.fold((l) {
          emit(UserSignUpErrorState(l.message));
        }, (r) {
          /*  //save password in cache
          CacheHelper.saveData(key: CacheKeys.password, value: userSignUpRequest.password);
          //save credentials
          saveCredentials(r); */

          emit(UserSignUpSuccessState());
        }));
  }

  Future<void> verifySignupCode(String otp) async {
    emit(VerifyOtpLoadingState());
    await _verifySignupOtpUseCase
        .execude(VerifyOtpRequest(phoneController.text, otp))
        .then((value) => value.fold((l) {
              emit(VerifyOtpErrorState(l.message));
            }, (r) async {
              //save password in cache
              CacheHelper.saveData(key: CacheKeys.password, value: passwordController.text);
              //save credentials
              await saveCredentials(r);

              emit(VerifyOtpSuccessState());
            }));
  }

  Future<void> reSendCode() async {
    emit(ReSendOtpLoadingState());
    await _resendSignupCodeUseCase.execude(phoneController.text).then((value) => value.fold((l) {
          emit(ReSendOtpErrorState(l.message));
        }, (r) {
          emit(ReSendOtpSuccessState());
        }));
  }

  Future saveCredentials(MainUserAuthModel mainUserAuthModel) async {
    //save token in cache
    await CacheHelper.saveData(key: CacheKeys.token, value: mainUserAuthModel.data?.token ?? "")
        .then((value) {
      //set token value
      Constants.token = CacheHelper.getData(key: CacheKeys.token);
    });
    //save refresh token in cache
  }
}
