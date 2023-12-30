import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../../data/network/auth_requests.dart';
import '../Repository/auth_repo.dart';
import '../models/login_model.dart';

class InspectorLoginUseCase {
  final AuthRepository _authRepository;
  InspectorLoginUseCase(
    this._authRepository,
  );

  Future<Either<Failure, MainUserAuthModel>> execude(LoginRequest loginRequest) async {
    return await _authRepository.inspectorLogin(loginRequest);
  }
}
