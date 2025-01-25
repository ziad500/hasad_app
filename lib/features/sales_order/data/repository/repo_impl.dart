import 'package:hasad_app/core/execute_error_handler.dart';

import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/sales_order/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/sales_order/data/mapper/mapper.dart';
import 'package:hasad_app/features/sales_order/domain/models/model.dart';
import 'package:hasad_app/features/sales_order/domain/repository/repo.dart';
import '../../../../../core/failure.dart';

class SalesOrdersRepositoryImpl implements SalesOrdersRepository {
  final SalesOrdersRemoteDataSource _directSellingListRemoteDataSource;

  SalesOrdersRepositoryImpl(this._directSellingListRemoteDataSource);

  @override
  Future<Either<Failure, SalesOrdersModel>> getSalesOrderes(String page) {
    return executeAndHandleError<SalesOrdersModel>(() async {
      final response = await _directSellingListRemoteDataSource.getSalesOrderes(page);
      return response.toDomain();
    });
  }
}
