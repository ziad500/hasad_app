import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../../data/network/auth_requests.dart';
import '../Repository/auth_repo.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;
  LogoutUseCase(
    this._authRepository,
  );

  Future<Either<Failure, dynamic>> execude(LogOutRequest logOutRequest) async {
    return await _authRepository.logout(logOutRequest);
  }
}
