import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../../data/network/requests.dart';
import '../models/lists_model.dart';
import '../repository/lists_repo.dart';

class GetTypesListUseCase {
  final ListsRepository _listsRepository;
  GetTypesListUseCase(
    this._listsRepository,
  );

  Future<Either<Failure, ListsModel>> execude(DepartmentsListRequest departmentsListRequest) async {
    return await _listsRepository.typesLists(departmentsListRequest);
  }
}
