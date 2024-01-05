import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../models/profile_model.dart';
import '../repository/profile_repo.dart';

class GetProfileUseCase {
  final ProfileRepository _profileRepository;
  GetProfileUseCase(
    this._profileRepository,
  );

  Future<Either<Failure, ProfileModel>> execude() async {
    return await _profileRepository.getProfile();
  }
}
