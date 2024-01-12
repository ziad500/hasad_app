import '../../data/network/requests.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../repository/profile_repo.dart';

class ChangePasswordUseCase {
  final ProfileRepository _profileRepository;
  ChangePasswordUseCase(
    this._profileRepository,
  );

  Future<Either<Failure, dynamic>> execude(ChangePasswordRequest changePasswordRequest) async {
    return await _profileRepository.changePassword(changePasswordRequest);
  }
}
