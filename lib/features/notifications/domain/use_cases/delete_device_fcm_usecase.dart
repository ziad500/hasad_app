import 'package:dartz/dartz.dart';
import '../../data/network/requests.dart';
import '../repository/notifications_repo.dart';

import '../../../../../core/failure.dart';

class DeleteDeviceFcmUsecase {
  final NotificationsRepository _repository;
  DeleteDeviceFcmUsecase(
    this._repository,
  );

  Future<Either<Failure, dynamic>> execude(DeleteDeviceFcmRequest deleteDeviceFcmRequest) async {
    return await _repository.deleteDeviceFcm(deleteDeviceFcmRequest);
  }
}
