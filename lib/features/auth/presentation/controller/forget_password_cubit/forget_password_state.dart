part of 'forget_password_cubit.dart';

class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

class ViewPasswordState extends ForgetPasswordState {}

class ConfirmViewPasswordState extends ForgetPasswordState {}

class OldViewPasswordState extends ForgetPasswordState {}

class RequestResetPasswordLoadingState extends ForgetPasswordState {}

class RequestResetPasswordSuccessState extends ForgetPasswordState {}

class RequestResetPasswordErrorState extends ForgetPasswordState {
  final String error;
  RequestResetPasswordErrorState(this.error);
}

class ResetPasswordLoadingState extends ForgetPasswordState {}

class ResetPasswordSuccessState extends ForgetPasswordState {
  final String successMessgae;
  ResetPasswordSuccessState(this.successMessgae);
}

class ResetPasswordErrorState extends ForgetPasswordState {
  final String error;
  ResetPasswordErrorState(this.error);
}

class VerifyOtpLoadingState extends ForgetPasswordState {}

class VerifyOtpSuccessState extends ForgetPasswordState {}

class VerifyOtpErrorState extends ForgetPasswordState {
  final String error;
  VerifyOtpErrorState(this.error);
}

class ChangePAgeViewIndexState extends ForgetPasswordState {}
