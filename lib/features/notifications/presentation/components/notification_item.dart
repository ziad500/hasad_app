import 'package:flutter/material.dart';
import 'package:hasad_app/common/dismiss_widget.dart';
import 'package:hasad_app/common/sub_title_widget.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/notifications/domain/models/notifications_model.dart';
import 'package:hasad_app/features/notifications/presentation/controller/notifications_cubit.dart';
import 'package:hasad_app/utils/date_helper.dart';
import 'package:hasad_app/utils/helpers.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.notificationsModel});
  final NotificationsModel notificationsModel;

  @override
  Widget build(BuildContext context) {
    return DismissWidget(
      confirmDismiss: (value) async {
        NotificationsCubit.get(context).deleteNotifications(notificationsModel.id!);
        return true;
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(title: isEmpty(notificationsModel.title)),
            const SizedBox(height: 10),
            SubTitleWidget(subTitle: isEmpty(notificationsModel.body)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                SubTitleWidget(
                    subTitle:
                        "${dateFormatTimestamp(DateTime.parse(notificationsModel.createdAt!))} ${timeFormatTimestamp(DateTime.parse(notificationsModel.createdAt!))}")
              ],
            )
          ],
        ),
      ),
    );
  }
}
