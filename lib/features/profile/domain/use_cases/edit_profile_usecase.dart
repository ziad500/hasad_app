import '../../data/network/requests.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../models/profile_model.dart';
import '../repository/profile_repo.dart';

class EditProfileUseCase {
  final ProfileRepository _profileRepository;
  EditProfileUseCase(
    this._profileRepository,
  );

  Future<Either<Failure, ProfileModel>> execude(EditProfileRequest editProfileRequest) async {
    return await _profileRepository.editProfile(editProfileRequest);
  }
}
