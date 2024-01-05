import 'package:dartz/dartz.dart';
import 'package:hasad_app/core/execute_error_handler.dart';
import 'package:hasad_app/core/failure.dart';
import 'package:hasad_app/features/categories/data/data_source/remote_data_source.dart';
import 'package:hasad_app/features/categories/data/mapper/mapper.dart';
import 'package:hasad_app/features/categories/domain/models/categories_model.dart';
import 'package:hasad_app/features/categories/domain/repository/repo.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;

  CategoriesRepositoryImpl(this._categoriesRemoteDataSource);

  @override
  Future<Either<Failure, CategoriesModel>> getCategories() {
    return executeAndHandleError<CategoriesModel>(() async {
      final response = await _categoriesRemoteDataSource.getCategories();
      return response.toDomain();
    });
  }

  @override
  Future<Either<Failure, CategoriesModel>> getCategoriesTypes(String categoryId) {
    return executeAndHandleError<CategoriesModel>(() async {
      final response = await _categoriesRemoteDataSource.getCategoriesTypes(categoryId);
      return response.toDomain();
    });
  }
}
