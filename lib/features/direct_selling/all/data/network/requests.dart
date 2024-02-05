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
  String? departmentId;
  String? title;
  GetMainListRequest(
      {this.agricultureTypeId,
      this.cityId,
      this.districtId,
      this.harvestDate,
      this.highestPrice,
      this.lowestPrice,
      this.packagingTypeId,
      this.page,
      this.regionId,
      this.departmentId,
      this.title});
}
