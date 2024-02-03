abstract class NotificationsStates {}

class NotificationsScreenInitial extends NotificationsStates {}

class GetNotificationsLoadingState extends NotificationsStates {}

class GetNotificationsSuccessState extends NotificationsStates {}

class GetNotificationsErrorState extends NotificationsStates {
  final String error;
  GetNotificationsErrorState(this.error);
}

class InternetErrorState extends NotificationsStates {}

class ReadNotificationsLoadingState extends NotificationsStates {}

class ReadNotificationsSuccessState extends NotificationsStates {}

class ReadNotificationsErrorState extends NotificationsStates {
  final String error;
  ReadNotificationsErrorState(this.error);
}

class DeleteNotificationsLoadingState extends NotificationsStates {}

class DeleteNotificationsSuccessState extends NotificationsStates {}

class DeleteNotificationsErrorState extends NotificationsStates {
  final String error;
  DeleteNotificationsErrorState(this.error);
}

class HasUnReadNotificationsLoadingState extends NotificationsStates {}

class HasUnReadNotificationsSuccessState extends NotificationsStates {}

class HasUnReadNotificationsErrorState extends NotificationsStates {
  final String error;
  HasUnReadNotificationsErrorState(this.error);
}

class SelectNotificaationWidget extends NotificationsStates {}

class ExpandNotificationState extends NotificationsStates {}

final class GetNotificationsListLoadingState extends NotificationsStates {}

final class GetNotificationsListPaginationLoadingState extends NotificationsStates {}

final class GetNotificationsListSuccessState extends NotificationsStates {}

final class GetNotificationsListErrorState extends NotificationsStates {
  final String error;
  GetNotificationsListErrorState(this.error);
}

final class NotificationsListAllCaughtState extends NotificationsStates {}

final class ResetNotifi extends NotificationsStates {}
