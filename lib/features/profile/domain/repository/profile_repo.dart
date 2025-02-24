import '../../data/network/requests.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../models/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> getProfile();
  Future<Either<Failure, ProfileModel>> editProfile(EditProfileRequest editProfileRequest);
  Future<Either<Failure, dynamic>> changePassword(ChangePasswordRequest changePasswordRequest);
  Future<Either<Failure, SettingsModel>> getAppSettings();
}
