import 'package:hasad_app/core/responses/success_response.dart';
import 'package:hasad_app/features/bidding/details/data/network/bidding_details_api.dart';
import 'package:hasad_app/features/direct_selling/details/data/response/response.dart';

abstract class BiddingDetailsRemoteDataSource {
  Future<DirectSellingDetailsResponse> getBiddingDetails(String advertisementId);

  Future<SuccessResponse> buyBiddingAdvertisement(String? advertisementId);

  Future<SuccessResponse> bidBiddingAdvertisement(String? advertisementId, String? bidPrice);

  Future<SuccessResponse> payInsuranceBiddingAdvertisement(String? advertisementId);
}

class BiddingDetailsRemoteDataSourceImpl implements BiddingDetailsRemoteDataSource {
  final BiddingDetailsAppServiceClient _biddingDetailsAppServiceClient;
  BiddingDetailsRemoteDataSourceImpl(
    this._biddingDetailsAppServiceClient,
  );

  @override
  Future<DirectSellingDetailsResponse> getBiddingDetails(String advertisementId) =>
      _biddingDetailsAppServiceClient.getBiddingDetails(advertisementId);

  @override
  Future<SuccessResponse> buyBiddingAdvertisement(String? advertisementId) =>
      _biddingDetailsAppServiceClient.buyBiddingAdvertisement(advertisementId);

  @override
  Future<SuccessResponse> bidBiddingAdvertisement(String? advertisementId, String? bidPrice) =>
      _biddingDetailsAppServiceClient.bidBiddingAdvertisement(advertisementId, bidPrice);
  @override
  Future<SuccessResponse> payInsuranceBiddingAdvertisement(String? advertisementId) =>
      _biddingDetailsAppServiceClient.payInsuranceBiddingAdvertisement(advertisementId);
}
