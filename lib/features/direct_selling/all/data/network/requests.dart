class GetMainListRequest {
  String? agricultureTypeId;
  String? packagingTypeId;
  String? harvestDate;
  String? regionId;
  String? cityId;
  String? districtId;
  String? lowestPrice;
  String? highestPrice;
  String? page;
  GetMainListRequest(
      {this.agricultureTypeId,
      this.cityId,
      this.districtId,
      this.harvestDate,
      this.highestPrice,
      this.lowestPrice,
      this.packagingTypeId,
      this.page,
      this.regionId});
}
