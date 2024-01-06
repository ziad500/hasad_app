import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

import 'package:hasad_app/features/direct_selling/all/data/network/requests.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

abstract class BiddingListRepository {
  Future<Either<Failure, DirectSellingListModel>> biddingList(
      GetMainListRequest getMainListRequest, String type);

  Future<Either<Failure, DirectSellingListModel>> myBiddingList(String? page);
}
