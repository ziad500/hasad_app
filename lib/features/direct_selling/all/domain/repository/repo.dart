import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/orders_model.dart';

import '../../data/network/requests.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

abstract class DirectSellingListRepository {
  Future<Either<Failure, DirectSellingListModel>> directSellingList(
      GetMainListRequest getMainListRequest);

  Future<Either<Failure, DirectSellingListModel>> myDirectSellingList(String? page);

  Future<Either<Failure, DirectSellingOrdersListModel>> directSellingOrdersList(String? page);
}
