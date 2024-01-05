import 'package:hasad_app/features/categories/data/response/categories_response.dart';
import 'package:hasad_app/features/categories/domain/models/categories_model.dart';

extension CategoryListResponseMapper on CategoryListResponse? {
  CategoryListModel toDomain() {
    return CategoryListModel(this?.id, this?.name, this?.image);
  }
}

extension CategoryResponseMapper on CategoriesResponse? {
  CategoriesModel toDomain() {
    return CategoriesModel(
        this?.status, this?.message, this?.data?.map((e) => e.toDomain()).toList());
  }
}
