import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/notifications/presentation/components/notification_list.dart';
import 'package:hasad_app/features/notifications/presentation/controller/notifications_cubit.dart';
import 'package:hasad_app/features/notifications/presentation/controller/notifications_state.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NotificationsCubit>()
        ..readNotifications()
        ..getNotificationsList(),
      child: BlocListener<NotificationsCubit, NotificationsStates>(
        listener: (context, state) {
          if (state is DeleteNotificationsSuccessState) {
            NotificationsCubit.get(context).reset();
            NotificationsCubit.get(context).getNotificationsList();
          }
        },
        child: DefaultScaffold(
          appbarTitle: LocaleKeys.notifications.tr(),
          body: const NotificationsListView(),
        ),
      ),
    );
  }
}
