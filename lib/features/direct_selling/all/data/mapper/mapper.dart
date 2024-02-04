import 'package:hasad_app/core/responses/pagination_response.dart';
import 'package:hasad_app/features/direct_selling/all/data/response/response.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/profile/data/mapper/profile_mapper.dart';

extension TypeResponseMapper on TypeResponse? {
  TypeModel toDomain() {
    return TypeModel(this?.image, this?.name);
  }
}

extension DirectSellingDataResponseMapper on DirectSellingDataResponse? {
  DirectSellingDataModel toDomain() {
    return DirectSellingDataModel(
        this?.city.toDomain(),
        this?.description,
        this?.district.toDomain(),
        this?.id,
        this?.images,
        this?.price,
        this?.region.toDomain(),
        this?.title,
        this?.advertisementType,
        this?.agricultureType.toDomain(),
        this?.createdAt,
        this?.department,
        this?.departmentType,
        this?.harvestDate,
        this?.packagingType.toDomain(),
        this?.owner.toDomain(),
        this?.video,
        this?.priceInclusions,
        this?.auctionPrice,
        this?.closed,
        this?.expiryTime,
        this?.numberOfAuctions,
        this?.purchasingPrice,
        this?.biddingDate,
        this?.priceAfterTax,
        this?.purchaseTax,
        this?.lastBid.toDomain());
  }
}

extension DirectSellingListResponseMapper on DirectSellingListResponse? {
  DirectSellingListModel toDomain() {
    return DirectSellingListModel(this?.status, this?.message,
        this?.data?.map((e) => e.toDomain()).toList(), this?.pagination.toDomain());
  }
}

extension LastBidResponseMapper on LastBidResponse? {
  LastBidModel toDomain() {
    return LastBidModel(this?.value, this?.name, this?.image, this?.createdAt);
  }
}

extension LocationResponseMapper on LocationResponse? {
  LocationModel toDomain() {
    return LocationModel(this?.id, this?.name);
  }
}
