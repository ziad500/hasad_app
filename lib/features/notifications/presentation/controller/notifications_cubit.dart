import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/features/notifications/data/network/requests.dart';
import 'package:hasad_app/features/notifications/domain/models/has_un_read_notifications_model.dart';
import 'package:hasad_app/features/notifications/domain/models/notifications_model.dart';
import 'package:hasad_app/features/notifications/domain/use_cases/delete_device_fcm_usecase.dart';
import 'package:hasad_app/features/notifications/domain/use_cases/delete_notification_usecase.dart';
import 'package:hasad_app/features/notifications/domain/use_cases/get_notification_usecase.dart';
import 'package:hasad_app/features/notifications/domain/use_cases/has_un_read_notifications_usecase.dart';
import 'package:hasad_app/features/notifications/domain/use_cases/read_notification_usecase.dart';
import 'package:hasad_app/features/notifications/presentation/controller/notifications_state.dart';

/// This file defines the `NotificationsCubit` class, responsible for managing
/// notifications in the application using the BLoC (Business Logic Component) pattern.
///
/// The `NotificationsCubit` class encapsulates the following functionality:
///
/// - Fetching notifications and handling pagination.
/// - Marking notifications as read.
/// - Deleting notifications.
/// - Checking for unread notifications.
/// - Managing FCM (Firebase Cloud Messaging) devices.
///
/// This file promotes clean and organized code by encapsulating related functionality
/// within a single class.
///
/// The class provides detailed documentation for its methods and components to
/// improve code readability and maintainability.

/// The `NotificationsCubit` class is responsible for managing notifications.
class NotificationsCubit extends Cubit<NotificationsStates> {
  final ReadNotificationsUsecase readNotificationsUsecase;
  final HasUnReadNotificationsUsecase hasUnReadNotificationsUsecase;
  final DeleteNotificationsUsecase deleteNotificationsUsecase;
  final DeleteDeviceFcmUsecase deleteDeviceFcmUsecase;
  final GetNotificationsUsecase getNotificationsUsecase;

  /// Initializes a new instance of the `NotificationsCubit`.
  ///
  /// The constructor injects dependencies like use cases to facilitate
  /// notification management.
  NotificationsCubit(
    this.getNotificationsUsecase,
    this.readNotificationsUsecase,
    this.hasUnReadNotificationsUsecase,
    this.deleteNotificationsUsecase,
    this.deleteDeviceFcmUsecase,
  ) : super(NotificationsScreenInitial());

  /// Static factory method to get the `NotificationsCubit` instance.
  ///
  /// This method is used to obtain an instance of the `NotificationsCubit`
  /// within the application context.
  static NotificationsCubit get(context) => BlocProvider.of(context);

  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  List<NotificationsModel> notifications = [];
  NotificationsPaginationModel? notificationsPaginationModel;

  //////////////////////////// all direct selling list //////////////////////////////
  Future<void> getNotificationsList() async {
    if (_canFetchMore()) {
      _emitLoadingState();
      await getNotificationsUsecase.execude(GetNotificationsRequest(getPageNumber()!)).then(
          (value) => value.fold((l) => emit(GetNotificationsListErrorState(l.message)),
              (r) => _handleSuccessState(r)));
    }
  }

  reset() {
    notifications = [];
    notificationsPaginationModel = null;
    emit(ResetNotifi());
  }

  void _emitSuccessState() {
    emit(GetNotificationsListSuccessState());
    if (notificationsPaginationModel?.pagination?.nextPageUrl == null) {
      emit(NotificationsListAllCaughtState());
    }
  }

  void _handleSuccessState(NotificationsPaginationModel response) {
    if (notificationsPaginationModel == null) {
      notifications = response.data ?? [];
      notificationsPaginationModel = response;
    } else {
      if (notifications.any((element) => element.id == response.data?[0].id) ||
          notifications.any((element) => element.id == response.data?[1].id)) {
      } else {
        notifications.addAll(response.data ?? []);
        notificationsPaginationModel = response;
      }
    }
    _emitSuccessState();
  }

  void _emitLoadingState() {
    if (notificationsPaginationModel == null) {
      emit(GetNotificationsListLoadingState());
    } else {
      emit(GetNotificationsListPaginationLoadingState());
    }
  }

  bool _canFetchMore() => state is! NotificationsListAllCaughtState;

  String? getPageNumber() {
    String? nextPageNumber = notificationsPaginationModel?.pagination?.nextPageUrl
        ?.split('?')
        .firstWhere((element) => element.contains("page"));
    try {
      nextPageNumber = nextPageNumber!.split("=").last;
    } catch (_) {
      nextPageNumber = "1";
    }
    return nextPageNumber;
  }

/////////////////////////////////////////////////////////////////////////

  /// Method to mark notifications as read.
  Future<void> readNotifications() async {
    await readNotificationsUsecase.execude();
  }

  /// Method to delete a notification.
  ///
  /// - [notificationId]: The ID of the notification to be deleted.
  Future<void> deleteNotifications(String notificationId) async {
    emit(DeleteNotificationsLoadingState());
    await deleteNotificationsUsecase
        .execude(DeleteNotificationsRequest(notificationId))
        .then((value) => value.fold((l) {
              emit(DeleteNotificationsErrorState(l.message));
            }, (r) {
              notifications.removeWhere((element) => element.id == notificationId);
              emit(DeleteNotificationsSuccessState());
            }));
  }

  HasUnReadNotificationsModel? hasUnReadNotificationsModel;

  /// Method to check for unread notifications.
  Future<void> hasUnReadNotifications() async {
    emit(HasUnReadNotificationsLoadingState());

    await hasUnReadNotificationsUsecase.execude().then((value) => value.fold((l) {
          emit(HasUnReadNotificationsErrorState(l.message));
        }, (r) {
          hasUnReadNotificationsModel = r;
          emit(HasUnReadNotificationsSuccessState());
        }));
  }

  /// Method to delete the FCM device.
  ///
  /// This method deletes the FCM device by interacting with the respective use case.
  ///
  /// - [deleteDeviceFcmRequest]: The request to delete the FCM device.
  Future<void> deleteDeviceFcm(DeleteDeviceFcmRequest deleteDeviceFcmRequest) async {
    await deleteDeviceFcmUsecase.execude(deleteDeviceFcmRequest);
  }
}
