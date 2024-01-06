import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';

class DirectSellingDetailsModel {
  bool? status;
  String? message;
  DirectSellingDataModel? data;

  DirectSellingDetailsModel(this.status, this.message, this.data);
}
