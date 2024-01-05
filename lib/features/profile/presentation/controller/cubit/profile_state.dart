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
