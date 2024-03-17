part of 'login_cubit.dart';

class LoginState {}

final class LoginInitial extends LoginState {}

final class ChangeUSerTypeState extends LoginState {}

class ViewPasswordState extends LoginState {}

class LoginLoadingState extends LoginState {}

class UserLoginSuccessState extends LoginState {}

class InspectorLoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}

class LogoutLoadingState extends LoginState {}

class UserLogoutSuccessState extends LoginState {}

class LogoutErrorState extends LoginState {
  final String error;
  LogoutErrorState(this.error);
}
