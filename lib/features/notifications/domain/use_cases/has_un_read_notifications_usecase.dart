import 'package:dartz/dartz.dart';
import '../models/has_un_read_notifications_model.dart';
import '../repository/notifications_repo.dart';

import '../../../../../core/failure.dart';

class HasUnReadNotificationsUsecase {
  final NotificationsRepository _repository;
  HasUnReadNotificationsUsecase(
    this._repository,
  );

  Future<Either<Failure, HasUnReadNotificationsModel>> execude() async {
    return await _repository.hasUnReadNotifications();
  }
}
