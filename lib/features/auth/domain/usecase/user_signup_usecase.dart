import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../../data/network/auth_requests.dart';
import '../Repository/auth_repo.dart';
import '../models/login_model.dart';

class UserSignUpUseCase {
  final AuthRepository _authRepository;
  UserSignUpUseCase(
    this._authRepository,
  );

  Future<Either<Failure, MainUserAuthModel>> execude(UserSignUpRequest userSignUpRequest) async {
    return await _authRepository.userSignUp(userSignUpRequest);
  }
}
