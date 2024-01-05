import '../../domain/models/lists_model.dart';
import '../responses/lists_response.dart';

extension ListsResponseMapper on ListsResponse? {
  ListsModel toDomain() {
    List<ListsDataModel>? data = this?.data?.map((e) => e.toDomain()).toList();
    return ListsModel(this?.status, this?.message, data);
  }
}

extension ListsDataResponseMapper on ListsDataResponse? {
  ListsDataModel toDomain() {
    return ListsDataModel(this?.id, this?.name, this?.image);
  }
}
