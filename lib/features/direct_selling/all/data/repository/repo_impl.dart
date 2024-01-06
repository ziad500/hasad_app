import 'package:hasad_app/core/execute_error_handler.dart';
import 'package:hasad_app/features/direct_selling/all/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/direct_selling/all/data/mapper/mapper.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/direct_selling/all/domain/repository/repo.dart';

import '../network/requests.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/failure.dart';

class DirectSellingListRepositoryImpl implements DirectSellingListRepository {
  final DirectSellingListRemoteDataSource _directSellingListRemoteDataSource;

  DirectSellingListRepositoryImpl(this._directSellingListRemoteDataSource);

  @override
  Future<Either<Failure, DirectSellingListModel>> directSellingList(
      GetMainListRequest getMainListRequest) {
    return executeAndHandleError<DirectSellingListModel>(() async {
      final response =
          await _directSellingListRemoteDataSource.directSellingList(getMainListRequest);
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, DirectSellingListModel>> myDirectSellingList(String? page) {
    return executeAndHandleError<DirectSellingListModel>(() async {
      final response = await _directSellingListRemoteDataSource.myDirectSellingList(page);
      return response.toDomain();
    });
  }
}
