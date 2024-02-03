import 'package:dartz/dartz.dart';
import '../../data/network/requests.dart';
import '../models/notifications_model.dart';
import '../repository/notifications_repo.dart';

import '../../../../../core/failure.dart';

class GetNotificationsUsecase {
  final NotificationsRepository _repository;
  GetNotificationsUsecase(
    this._repository,
  );

  Future<Either<Failure, NotificationsPaginationModel>> execude(
      GetNotificationsRequest getNotificationsRequest) async {
    return await _repository.getNotifications(getNotificationsRequest);
  }
}
