import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/main_item.dart';
import 'package:hasad_app/common/row_of_text.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/bidding/presentation/components/category_list.dart';
import 'package:hasad_app/features/bidding/presentation/components/search_notification_bar.dart';
import 'package:hasad_app/utils/app_colors.dart';

class BiddingScreen extends StatelessWidget {
  const BiddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchNotificationBar(),
            RowOfTextViewAllWidget(title: "أقسام المزادات", onPressed: () {}),
            SizedBox(
              height: 5.h,
            ),
            const CAtegoriesList(),
            SizedBox(
              height: 20.h,
            ),
            const TitleWidget(title: "مزادات علي وشك الانتهاء"),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
                child: DefaultListView(
                    itemBuilder: (context, index) => const MainItemWidget(isbidding: true),
                    count: 10))
          ],
        ),
      )),
    );
  }
}
