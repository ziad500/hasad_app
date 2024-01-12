import '../network/requests.dart';

import '../network/profile_api.dart';
import '../response/profile_response.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileResponse> getProfile();
  Future<ProfileResponse> editProfile(EditProfileRequest editProfileRequest);
  Future<dynamic> changePassword(ChangePasswordRequest changePasswordRequest);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileAppServiceClient _profileAppServiceClient;
  ProfileRemoteDataSourceImpl(
    this._profileAppServiceClient,
  );

  @override
  Future<ProfileResponse> getProfile() => _profileAppServiceClient.getProfile();

  @override
  Future<ProfileResponse> editProfile(EditProfileRequest editProfileRequest) =>
      _profileAppServiceClient.editProfile(editProfileRequest.name, editProfileRequest.phone,
          editProfileRequest.stc, editProfileRequest.image);

  @override
  Future changePassword(ChangePasswordRequest changePasswordRequest) =>
      _profileAppServiceClient.changePassword(changePasswordRequest.oldPassword,
          changePasswordRequest.password, changePasswordRequest.passwordConfirmation);
}
