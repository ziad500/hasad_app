import 'package:hasad_app/features/direct_selling/all/domain/models/orders_model.dart';
import 'package:hasad_app/features/direct_selling/all/domain/repository/repo.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class GetDirectSellingOrdersListUseCase {
  final DirectSellingListRepository _repository;
  GetDirectSellingOrdersListUseCase(
    this._repository,
  );

  Future<Either<Failure, DirectSellingOrdersListModel>> execude(String? page) async {
    return await _repository.directSellingOrdersList(page);
  }
}
