import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/sales_order/domain/models/model.dart';
import 'package:hasad_app/features/sales_order/domain/repository/repo.dart';

import '../../../../../core/failure.dart';

class GetSalesOrdersUsecse {
  final SalesOrdersRepository _repository;
  GetSalesOrdersUsecse(
    this._repository,
  );

  Future<Either<Failure, SalesOrdersModel>> execude(String page) async {
    return await _repository.getSalesOrderes(page);
  }
}
