import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../core/failure.dart';
import '../../domain/models/lists_model.dart';
import '../../domain/repository/lists_repo.dart';
import '../data_source/lists_data_source.dart';
import '../mapper/lists_mapper.dart';
import '../network/requests.dart';

class ListsRepositoryImpl implements ListsRepository {
  final ListsRemoteDataSource _listsRemoteDataSource;

  ListsRepositoryImpl(this._listsRemoteDataSource);

  @override
  Future<Either<Failure, ListsModel>> citiesLists(RegionsListRequest regionsListRequest) async {
    try {
      final response = await _listsRemoteDataSource.citiesLists(regionsListRequest);
      return right(response.toDomain());
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ListsModel>> districtsLists(RegionsListRequest regionsListRequest) async {
    try {
      final response = await _listsRemoteDataSource.districtsLists(regionsListRequest);
      return right(response.toDomain());
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ListsModel>> listsbyEndPoint(AllListsRequest allListsRequest) async {
    try {
      final response = await _listsRemoteDataSource.listsbyEndPoint(allListsRequest);
      return right(response.toDomain());
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ListsModel>> typesLists(
      DepartmentsListRequest departmentsListRequest) async {
    try {
      final response = await _listsRemoteDataSource.typesLists(departmentsListRequest);
      return right(response.toDomain());
    } catch (error) {
      if (error is DioException) {
        return left(hangdleResponseError(error));
      } else {
        return left(Failure(100, error.toString()));
      }
    }
  }
}
