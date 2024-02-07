import 'package:dartz/dartz.dart';
import 'package:hasad_app/features/requests/data/network/requests.dart';
import 'package:hasad_app/features/requests/domain/repository/repo.dart';

import '../../../../../core/failure.dart';

class EditRequestUseCase {
  final RequestsRepo _requestsRepo;
  EditRequestUseCase(
    this._requestsRepo,
  );

  Future<Either<Failure, dynamic>> execude(EditRequestRequest editRequestRequest) async {
    return await _requestsRepo.editRequest(editRequestRequest);
  }
}
