part of 'sign_up_cubit.dart';

class UserSignUpState {}

final class SignUpInitial extends UserSignUpState {}

class ViewPasswordState extends UserSignUpState {}

class ConfirmViewPasswordState extends UserSignUpState {}

class OldViewPasswordState extends UserSignUpState {}

class ChangePAgeViewIndexState extends UserSignUpState {}

class UserSignUpLoadingState extends UserSignUpState {}

class UserSignUpSuccessState extends UserSignUpState {}

class UserSignUpErrorState extends UserSignUpState {
  final String error;
  UserSignUpErrorState(this.error);
}
