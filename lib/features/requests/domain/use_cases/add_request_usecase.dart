import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/requests/data/network/requests.dart';
import 'package:hasad_app/features/requests/domain/repository/repo.dart';

import '../../../../../core/failure.dart';

class AddRequestUseCase {
  final RequestsRepo _requestsRepo;
  AddRequestUseCase(
    this._requestsRepo,
  );

  Future<Either<Failure, dynamic>> execude(AddRequestRequest addRequestRequest) async {
    return await _requestsRepo.addRequest(addRequestRequest);
  }
}
