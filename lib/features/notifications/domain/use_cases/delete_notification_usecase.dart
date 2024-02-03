import 'package:dartz/dartz.dart';
import '../../data/network/requests.dart';
import '../repository/notifications_repo.dart';

import '../../../../../core/failure.dart';

class DeleteNotificationsUsecase {
  final NotificationsRepository _repository;
  DeleteNotificationsUsecase(
    this._repository,
  );

  Future<Either<Failure, dynamic>> execude(
      DeleteNotificationsRequest deleteNotificationsRequest) async {
    return await _repository.deleteNotifications(deleteNotificationsRequest);
  }
}
