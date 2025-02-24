import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../models/profile_model.dart';
import '../repository/profile_repo.dart';

class GetAppSettingsUseCase {
  final ProfileRepository _profileRepository;
  GetAppSettingsUseCase(
    this._profileRepository,
  );

  Future<Either<Failure, SettingsModel>> execude() async {
    return await _profileRepository.getAppSettings();
  }
}
