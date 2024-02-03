import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/core/pagenation/base_list_view.dart';
import 'package:hasad_app/features/notifications/domain/models/notifications_model.dart';
import 'package:hasad_app/features/notifications/presentation/components/notification_item.dart';
import 'package:hasad_app/features/notifications/presentation/controller/notifications_cubit.dart';
import 'package:hasad_app/features/notifications/presentation/controller/notifications_state.dart';

///pagenated list view to fetch all the reports
///the page contains 8 reports , the '_ReportsListViewState' will has a 'ScrollController' variable
///which will listen to the list if any scroll happen [in case that the current scroll position is equal to or bigger that .7 of total height
///the cubit will call the fetching method to fetch the next page , this will happen only if the current state is not loading state
///which indicates that no fetchng request is happening now]
class NotificationsListView extends StatefulWidget {
  const NotificationsListView({super.key, this.expanded = false});
  final bool expanded;

  @override
  State<NotificationsListView> createState() => _NotificationsListViewState();
}

class _NotificationsListViewState extends State<NotificationsListView> {
  //to be attched with the listview
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NotificationsCubit>(context);

    return BlocBuilder<NotificationsCubit, NotificationsStates>(builder: (context, state) {
      //pass the cubit ,states and items type '<NotificationsCubit, NotificationsListDartState, ReportModel>'
      String? getError() {
        if (state is GetNotificationsListErrorState) {
          return state.error;
        }
        return null;
      }

      return PagenatedListView<NotificationsCubit, NotificationsStates, NotificationsModel>(
        useExpanded: widget.expanded,
        //start listening to fetch the next page when scroll to .7 total height
        init: () => controller.addListener(() async {
          var percentageOftotalLength = 0.7 * controller.position.maxScrollExtent;
          var currentLength = controller.position.pixels;
          if (currentLength >= percentageOftotalLength &&
              cubit.state is! GetNotificationsListPaginationLoadingState) {
            await cubit.getNotificationsList();
          }
        }),
        controller: controller,
        //build this widget for the cureent screen
        childBuilder: (index) => NotificationWidget(notificationsModel: cubit.notifications[index]),
        items: cubit.notifications,
        //indicates that you do not has any other pages to fetch
        allCaught: state is NotificationsListAllCaughtState,
        //indicates that you we currently fetching the next page
        isLoading: state is GetNotificationsListPaginationLoadingState,
        mainLoading: state is GetNotificationsListLoadingState,
        isError: state is GetNotificationsListErrorState, error: getError(),
      );
    });
  }
}
