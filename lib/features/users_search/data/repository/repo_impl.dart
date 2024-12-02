import 'package:hasad_app/core/execute_error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/users_search/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/users_search/data/mapper/mapper.dart';
import 'package:hasad_app/features/users_search/domain/models/user_data_model.dart';
import 'package:hasad_app/features/users_search/domain/repository/repo.dart';
import '../../../../../core/failure.dart';

class UsersSearchRepositoryImpl implements UsersSearchRepository {
  final UsersSearchRemoteDataSource _usersSearchRemoteDataSource;

  UsersSearchRepositoryImpl(this._usersSearchRemoteDataSource);

  @override
  Future<Either<Failure, UsersModel>> getUsers(String? userName, String? userId) {
    return executeAndHandleError<UsersModel>(() async {
      final response = await _usersSearchRemoteDataSource.getUsers(userName, userId);
      return response.toDomain();
    });
  }
}
