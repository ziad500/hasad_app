part of 'change_password_cubit.dart';

class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ConfirmViewPasswordState extends ChangePasswordState {}

final class ViewPasswordState extends ChangePasswordState {}

final class OldViewPasswordState extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {}

class ChangePasswordErrorState extends ChangePasswordState {
  final String error;
  ChangePasswordErrorState(this.error);
}
