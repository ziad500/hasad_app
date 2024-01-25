import 'package:hasad_app/features/bidding/all/data/network/bidding_list_api.dart';
import 'package:hasad_app/features/bidding/all/data/response/orders_response.dart';
import 'package:hasad_app/features/direct_selling/all/data/response/response.dart';
import 'package:hasad_app/features/direct_selling/all/data/network/requests.dart';

abstract class BiddingListRemoteDataSource {
  Future<DirectSellingListResponse> biddingList(GetMainListRequest getMainListRequest, String type);

  Future<DirectSellingListResponse> myBiddingList(String? page);
  Future<BiddingOrdersListResponse> biddingOrdersList(String? page);
}

class BiddingListRemoteDataSourceImpl implements BiddingListRemoteDataSource {
  final BiddingListAppServiceClient _directSellingListAppServiceClient;
  BiddingListRemoteDataSourceImpl(
    this._directSellingListAppServiceClient,
  );

  @override
  Future<DirectSellingListResponse> biddingList(
          GetMainListRequest getMainListRequest, String type) =>
      _directSellingListAppServiceClient.biddingList(
          type,
          getMainListRequest.agricultureTypeId,
          getMainListRequest.packagingTypeId,
          getMainListRequest.harvestDate,
          getMainListRequest.regionId,
          getMainListRequest.cityId,
          getMainListRequest.districtId,
          getMainListRequest.lowestPrice,
          getMainListRequest.highestPrice,
          getMainListRequest.page,
          getMainListRequest.departmentId);
  @override
  Future<DirectSellingListResponse> myBiddingList(String? page) =>
      _directSellingListAppServiceClient.myBiddingList(page);

  @override
  Future<BiddingOrdersListResponse> biddingOrdersList(String? page) =>
      _directSellingListAppServiceClient.biddingOrdersList(page);
}
