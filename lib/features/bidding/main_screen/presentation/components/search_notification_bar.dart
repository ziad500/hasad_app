import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/search_bar.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class SearchNotificationBar extends StatelessWidget {
  const SearchNotificationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SearchBarWidget(
          onTap: () {
            if (Constants.token == "") {
              Navigator.pushNamed(context, Routes.loginRoutes);
            } else {
              Navigator.pushNamed(context, Routes.biddingSearchScreen);
            }
          },
        )),
        const SizedBox(
          width: 10,
        ),
        const _NotificationWidget()
      ],
    );
  }
}

class _NotificationWidget extends StatelessWidget {
  const _NotificationWidget();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Constants.token == "") {
          Navigator.pushNamed(context, Routes.loginRoutes);
        } else {
          Navigator.pushNamed(context, Routes.notificationsScreen);
        }
      },
      child: Stack(
        children: [
          CircleAvatar(
            radius: 23.w,
            backgroundColor: Colors.transparent,
            child: CircleAvatar(
              radius: 20.w,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(SVGManager.notification),
            ),
          ),
          /*   CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 10,
            child: Text(
              "15",
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),
            ),
          ) */
        ],
      ),
    );
  }
}
