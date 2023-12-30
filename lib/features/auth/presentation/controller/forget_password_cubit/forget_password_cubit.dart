import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../data/network/auth_requests.dart';
import '../../../domain/usecase/request_change_password_usecase.dart';
import '../../../domain/usecase/reset_password_usecase.dart';
import '../../../domain/usecase/verify_otp_usecase.dart';
import '../../screens/forget_password/view/forget_password1/view/forget_password1_screen.dart';
import '../../screens/forget_password/view/forget_password2/view/forget_password2_screen.dart';
import '../../screens/forget_password/view/forget_password3/view/forget_password3_screen.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final RequestChangePasswordUseCase requestChangePasswordUseCase;
  ForgetPasswordCubit(
      this.resetPasswordUseCase, this.verifyOtpUseCase, this.requestChangePasswordUseCase)
      : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

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

  List<Widget> screens = [const ForgetPassword1(), ForgetPassword2(), ForgetPassword3()];

  PageController pageController = PageController();

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

  final TextEditingController emailController = TextEditingController();

  Future<void> requestResetPasswod(
      RequestChangePasswordRequest requestChangePasswordRequest) async {
    emit(RequestResetPasswordLoadingState());
    await requestChangePasswordUseCase
        .execude(requestChangePasswordRequest)
        .then((value) => value.fold((l) {
              emit(RequestResetPasswordErrorState(l.message));
            }, (r) {
              emit(RequestResetPasswordSuccessState());
            }));
  }

  Future<void> resetPasswod(ResetPasswordRequest resetPasswordRequest) async {
    emit(ResetPasswordLoadingState());
    await resetPasswordUseCase.execude(resetPasswordRequest).then((value) => value.fold((l) {
          emit(ResetPasswordErrorState(l.message));
        }, (r) {
          emit(ResetPasswordSuccessState(r['message']));
        }));
  }

  Future<void> verifyOtp(VerifyOtpRequest verifyOtpRequest) async {
    emit(VerifyOtpLoadingState());
    await verifyOtpUseCase.execude(verifyOtpRequest).then((value) => value.fold((l) {
          emit(VerifyOtpErrorState(l.message));
        }, (r) {
          emit(VerifyOtpSuccessState());
        }));
  }
}
