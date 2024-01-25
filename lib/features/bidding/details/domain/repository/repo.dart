import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/direct_selling/details/domain/models/direct_selling_details_model.dart';

import '../../../../../core/failure.dart';

abstract class BiddingDetailsRepository {
  Future<Either<Failure, DirectSellingDetailsModel>> getBiddingDetails(String advertisementId);

  Future<Either<Failure, SuccessModel>> buyBiddingAdvertisement(String? advertisementId);
}
