import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/sales_order/domain/models/model.dart';

import '../../../../../core/failure.dart';

abstract class SalesOrdersRepository {
  Future<Either<Failure, SalesOrdersModel>> getSalesOrderes(String page);
}
