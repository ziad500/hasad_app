import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/direct_selling/details/domain/models/direct_selling_details_model.dart';

import '../../../../../core/failure.dart';

abstract class BiddingDetailsRepository {
  Future<Either<Failure, DirectSellingDetailsModel>> getBiddingDetails(String advertisementId);
}
