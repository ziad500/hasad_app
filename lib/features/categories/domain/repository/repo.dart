import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/categories/domain/models/categories_model.dart';

import '../../../../../core/failure.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, CategoriesModel>> getCategories();

  Future<Either<Failure, CategoriesModel>> getCategoriesTypes(String categoryId);
}
