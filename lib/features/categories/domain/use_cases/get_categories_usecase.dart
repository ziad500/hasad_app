import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/categories/domain/models/categories_model.dart';
import 'package:hasad_app/features/categories/domain/repository/repo.dart';

import '../../../../../core/failure.dart';

class GetCategoriesUseCase {
  final CategoriesRepository _categoriesRepository;
  GetCategoriesUseCase(
    this._categoriesRepository,
  );

  Future<Either<Failure, CategoriesModel>> execude() async {
    return await _categoriesRepository.getCategories();
  }
}
