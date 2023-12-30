import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../../data/network/auth_requests.dart';
import '../Repository/auth_repo.dart';
import '../models/sign_up_model.dart';

class IncpectorSignUpUseCase {
  final AuthRepository _authRepository;
  IncpectorSignUpUseCase(
    this._authRepository,
  );

  Future<Either<Failure, InespectorSignUpModel>> execude(
      InspectorSignUpRequest inspectorSignUpRequest) async {
    return await _authRepository.inspectorSignUp(inspectorSignUpRequest);
  }
}
