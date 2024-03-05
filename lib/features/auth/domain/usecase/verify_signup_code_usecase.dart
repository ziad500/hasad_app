import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/auth/domain/models/login_model.dart';

import '../../../../../core/failure.dart';
import '../../data/network/auth_requests.dart';
import '../Repository/auth_repo.dart';

class VerifySignupOtpUseCase {
  final AuthRepository _authRepository;
  VerifySignupOtpUseCase(
    this._authRepository,
  );

  Future<Either<Failure, MainUserAuthModel>> execude(VerifyOtpRequest verifyOtpRequest) async {
    return await _authRepository.verifySignupCode(verifyOtpRequest);
  }
}
