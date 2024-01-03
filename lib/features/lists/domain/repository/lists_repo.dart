import 'package:dartz/dartz.dart';

import '../../../../../core/failure.dart';
import '../../data/network/requests.dart';
import '../models/lists_model.dart';

abstract class ListsRepository {
  Future<Either<Failure, ListsModel>> listsbyEndPoint(AllListsRequest allListsRequest);

  Future<Either<Failure, ListsModel>> citiesLists(RegionsListRequest regionsListRequest);

  Future<Either<Failure, ListsModel>> typesLists(DepartmentsListRequest departmentsListRequest);

  Future<Either<Failure, ListsModel>> districtsLists(RegionsListRequest regionsListRequest);
}
