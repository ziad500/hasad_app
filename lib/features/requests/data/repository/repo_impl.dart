import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/execute_error_handler.dart';
import 'package:hasad_app/core/failure.dart';
import 'package:hasad_app/features/requests/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/requests/data/network/requests.dart';
import 'package:hasad_app/features/requests/domain/repository/repo.dart';

class RequestsRepositoryImpl implements RequestsRepo {
  final RequestsRemoteDataSource _requestsRemoteDataSource;

  RequestsRepositoryImpl(this._requestsRemoteDataSource);

  @override
  Future<Either<Failure, dynamic>> addRequest(AddRequestRequest addRequestRequest) {
    return executeAndHandleError<dynamic>(() async {
      final response = await _requestsRemoteDataSource.addRequest(addRequestRequest);
      return response;
    });
  }
}
