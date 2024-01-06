import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/features/direct_selling/all/domain/repository/repo.dart';

import '../../data/network/requests.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';

class GetDirectSellingListUseCase {
  final DirectSellingListRepository _repository;
  GetDirectSellingListUseCase(
    this._repository,
  );

  Future<Either<Failure, DirectSellingListModel>> execude(
      GetMainListRequest getMainListRequest) async {
    return await _repository.directSellingList(getMainListRequest);
  }
}
