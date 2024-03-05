import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/responses/success_response.dart';
import '../../../../../core/failure.dart';
import '../Repository/auth_repo.dart';

class ResendSignupCodeUseCase {
  final AuthRepository _authRepository;
  ResendSignupCodeUseCase(
    this._authRepository,
  );

  Future<Either<Failure, SuccessModel>> execude(String phone) async {
    return await _authRepository.reSendSignupCode(phone);
  }
}
