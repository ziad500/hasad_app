import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../../data/network/auth_requests.dart';
import '../Repository/auth_repo.dart';

class ResetPasswordUseCase {
  final AuthRepository _authRepository;
  ResetPasswordUseCase(
    this._authRepository,
  );

  Future<Either<Failure, dynamic>> execude(ResetPasswordRequest resetPasswordRequest) async {
    return await _authRepository.resetPassword(resetPasswordRequest);
  }
}
