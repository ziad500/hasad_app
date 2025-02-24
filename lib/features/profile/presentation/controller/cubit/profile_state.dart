part of 'profile_cubit.dart';

sealed class ProfileState {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {}

final class GetProfileDataLoadingState extends ProfileState {}

final class GetProfileDataSuccessState extends ProfileState {}

final class GetProfileDataErrorState extends ProfileState {
  final String error;
  const GetProfileDataErrorState(this.error);
}

final class EditProfileDataLoadingState extends ProfileState {}

final class EditProfileDataSuccessState extends ProfileState {}

final class EditProfileDataErrorState extends ProfileState {
  final String error;
  const EditProfileDataErrorState(this.error);
}

final class UploadProfileImageSuccess extends ProfileState {}

final class ChangePasswordLoadingState extends ProfileState {}

final class ChangePasswordSuccessState extends ProfileState {}

final class ChangePasswordErrorState extends ProfileState {
  final String error;
  const ChangePasswordErrorState(this.error);
}

final class GetAppSettingsDataLoadingState extends ProfileState {}

final class GetAppSettingsDataSuccessState extends ProfileState {}

final class GetAppSettingsDataErrorState extends ProfileState {
  final String error;
  const GetAppSettingsDataErrorState(this.error);
}
