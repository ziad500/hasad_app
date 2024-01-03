import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../../data/network/requests.dart';
import '../models/lists_model.dart';
import '../repository/lists_repo.dart';

class GetDistrictsListUseCase {
  final ListsRepository _listsRepository;
  GetDistrictsListUseCase(
    this._listsRepository,
  );

  Future<Either<Failure, ListsModel>> execude(RegionsListRequest regionsListRequest) async {
    return await _listsRepository.districtsLists(regionsListRequest);
  }
}
