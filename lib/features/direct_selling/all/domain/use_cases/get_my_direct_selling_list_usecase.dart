import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/direct_selling/all/domain/repository/repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class GetMyDirectSellingListUseCase {
  final DirectSellingListRepository _repository;
  GetMyDirectSellingListUseCase(
    this._repository,
  );

  Future<Either<Failure, DirectSellingListModel>> execude(String page, String? userId) async {
    return await _repository.myDirectSellingList(page, userId);
  }
}
