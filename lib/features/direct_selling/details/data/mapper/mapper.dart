import 'package:hasad_app/features/direct_selling/all/data/mapper/mapper.dart';
import 'package:hasad_app/features/direct_selling/details/data/response/response.dart';
import 'package:hasad_app/features/direct_selling/details/domain/models/direct_selling_details_model.dart';

extension DirectSellingDetailsResponseMapper on DirectSellingDetailsResponse? {
  DirectSellingDetailsModel toDomain() {
    return DirectSellingDetailsModel(this?.status, this?.message, this?.data.toDomain());
  }
}
