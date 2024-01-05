import 'package:hasad_app/features/categories/data/network/categories_api.dart';
import 'package:hasad_app/features/categories/data/response/categories_response.dart';

abstract class CategoriesRemoteDataSource {
  Future<CategoriesResponse> getCategories();

  Future<CategoriesResponse> getCategoriesTypes(String categoryId);
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final CategoriesAppServiceClient _categoriesAppServiceClient;
  CategoriesRemoteDataSourceImpl(
    this._categoriesAppServiceClient,
  );

  @override
  Future<CategoriesResponse> getCategories() => _categoriesAppServiceClient.getCategories();

  @override
  Future<CategoriesResponse> getCategoriesTypes(String categoryId) =>
      _categoriesAppServiceClient.getCategoriesTypes(categoryId);
}
