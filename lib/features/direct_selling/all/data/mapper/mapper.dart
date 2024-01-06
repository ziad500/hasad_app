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
        this?.city,
        this?.description,
        this?.district,
        this?.id,
        this?.images,
        this?.price,
        this?.region,
        this?.title,
        this?.advertisementType,
        this?.agricultureType.toDomain(),
        this?.createdAt,
        this?.department,
        this?.departmentType,
        this?.harvestDate,
        this?.packagingType.toDomain(),
        this?.user.toDomain(),
        this?.video);
  }
}

extension DirectSellingListResponseMapper on DirectSellingListResponse? {
  DirectSellingListModel toDomain() {
    return DirectSellingListModel(this?.status, this?.message,
        this?.data?.map((e) => e.toDomain()).toList(), this?.pagination.toDomain());
  }
}
