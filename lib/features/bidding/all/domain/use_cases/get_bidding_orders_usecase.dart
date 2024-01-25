import 'package:hasad_app/features/bidding/all/domain/models/orders_model.dart';
import 'package:hasad_app/features/bidding/all/domain/repository/repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class GetBiddingOrdersListUseCase {
  final BiddingListRepository _repository;
  GetBiddingOrdersListUseCase(
    this._repository,
  );

  Future<Either<Failure, BiddingOrdersListModel>> execude(String page) async {
    return await _repository.biddingOrdersList(page);
  }
}
