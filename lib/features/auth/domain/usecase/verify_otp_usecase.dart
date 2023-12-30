import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../../data/network/auth_requests.dart';
import '../Repository/auth_repo.dart';

class VerifyOtpUseCase {
  final AuthRepository _authRepository;
  VerifyOtpUseCase(
    this._authRepository,
  );

  Future<Either<Failure, dynamic>> execude(VerifyOtpRequest verifyOtpRequest) async {
    return await _authRepository.verifyOtp(verifyOtpRequest);
  }
}
