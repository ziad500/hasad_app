import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../../data/network/auth_requests.dart';
import '../Repository/auth_repo.dart';

class RequestChangePasswordUseCase {
  final AuthRepository _authRepository;
  RequestChangePasswordUseCase(
    this._authRepository,
  );

  Future<Either<Failure, dynamic>> execude(
      RequestChangePasswordRequest requestChangePasswordRequest) async {
    return await _authRepository.requestChangePassword(requestChangePasswordRequest);
  }
}
