import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/responses/success_response.dart';

import '../../../../../core/failure.dart';
import '../../data/network/auth_requests.dart';
import '../Repository/auth_repo.dart';

class UserSignUpUseCase {
  final AuthRepository _authRepository;
  UserSignUpUseCase(
    this._authRepository,
  );

  Future<Either<Failure, SuccessModel>> execude(UserSignUpRequest userSignUpRequest) async {
    return await _authRepository.userSignUp(userSignUpRequest);
  }
}
