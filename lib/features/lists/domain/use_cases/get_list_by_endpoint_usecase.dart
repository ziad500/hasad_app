import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../../data/network/requests.dart';
import '../models/lists_model.dart';
import '../repository/lists_repo.dart';

class GetListByEndPointUseCase {
  final ListsRepository _listsRepository;
  GetListByEndPointUseCase(
    this._listsRepository,
  );

  Future<Either<Failure, ListsModel>> execude(AllListsRequest allListsRequest) async {
    return await _listsRepository.listsbyEndPoint(allListsRequest);
  }
}
