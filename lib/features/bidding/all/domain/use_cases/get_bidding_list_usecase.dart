import 'package:hasad_app/features/bidding/all/domain/repository/repo.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

import 'package:hasad_app/features/direct_selling/all/data/network/requests.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class GetBiddingListUseCase {
  final BiddingListRepository _repository;
  GetBiddingListUseCase(
    this._repository,
  );

  Future<Either<Failure, DirectSellingListModel>> execude(
      GetMainListRequest getMainListRequest, String type) async {
    return await _repository.biddingList(getMainListRequest, type);
  }
}
