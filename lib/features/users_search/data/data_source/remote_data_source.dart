import 'package:hasad_app/features/users_search/data/network/users_search_api.dart';
import 'package:hasad_app/features/users_search/data/response/response.dart';

abstract class UsersSearchRemoteDataSource {
  Future<UsersResponse> getUsers(String? userName, String? userId);
}

class UsersSearchRemoteDataSourceImpl implements UsersSearchRemoteDataSource {
  final UsersSearchAppServiceClient _usersSearchAppServiceClient;
  UsersSearchRemoteDataSourceImpl(
    this._usersSearchAppServiceClient,
  );

  @override
  Future<UsersResponse> getUsers(String? userName, String? userId) =>
      _usersSearchAppServiceClient.getUsers(userName, userId);
}
