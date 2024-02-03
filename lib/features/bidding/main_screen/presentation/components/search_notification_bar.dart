import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hasad_app/common/search_bar.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class SearchNotificationBar extends StatelessWidget {
  const SearchNotificationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: SearchBarWidget()),
        SizedBox(
          width: 10,
        ),
        _NotificationWidget()
      ],
    );
  }
}

class _NotificationWidget extends StatelessWidget {
  const _NotificationWidget();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.notificationsScreen),
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
          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 10,
            child: Text(
              "15",
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
