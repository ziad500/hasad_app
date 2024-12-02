import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/users_search/domain/models/user_data_model.dart';

import '../../../../../core/failure.dart';

abstract class UsersSearchRepository {
  Future<Either<Failure, UsersModel>> getUsers(String? userName, String? userId);
}
