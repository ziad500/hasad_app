import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/users_search/domain/repository/repo.dart';

import '../../../../../core/failure.dart';

class GetUsersUseCase {
  final UsersSearchRepository _repository;
  GetUsersUseCase(
    this._repository,
  );

  Future<Either<Failure, dynamic>> execude(String? userName, String? userId) async {
    return await _repository.getUsers(userName, userId);
  }
}
