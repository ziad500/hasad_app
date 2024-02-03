import 'package:dartz/dartz.dart';
import '../repository/notifications_repo.dart';

import '../../../../../core/failure.dart';

class ReadNotificationsUsecase {
  final NotificationsRepository _repository;
  ReadNotificationsUsecase(
    this._repository,
  );

  Future<Either<Failure, dynamic>> execude() async {
    return await _repository.readNotifications();
  }
}
