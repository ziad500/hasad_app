import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../Repository/auth_repo.dart';

class DeleteAccountUseCase {
  final AuthRepository _authRepository;
  DeleteAccountUseCase(
    this._authRepository,
  );

  Future<Either<Failure, dynamic>> execude() async {
    return await _authRepository.deleteAccount();
  }
}
