import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/categories/domain/models/categories_model.dart';
import 'package:hasad_app/features/categories/domain/repository/repo.dart';

import '../../../../../core/failure.dart';

class GetCategoriesTypesUseCase {
  final CategoriesRepository _categoriesRepository;
  GetCategoriesTypesUseCase(
    this._categoriesRepository,
  );

  Future<Either<Failure, CategoriesModel>> execude(String categoryId) async {
    return await _categoriesRepository.getCategoriesTypes(categoryId);
  }
}
