import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/main_item.dart';
import 'package:hasad_app/common/row_of_text.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/categories/presentation/components/category_list.dart';
import 'package:hasad_app/features/bidding/presentation/components/search_notification_bar.dart';
import 'package:hasad_app/features/slider/presentation/components/slider.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
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
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const OffersSlider(),
                    RowOfTextViewAllWidget(
                        title: LocaleKeys.auctionCategories.tr(), onPressed: () {}),
                    SizedBox(
                      height: 5.h,
                    ),
                    const CategoriesList(type: 1),
                    SizedBox(
                      height: 20.h,
                    ),
                    TitleWidget(title: LocaleKeys.auctionsEndingSoon.tr()),
                    SizedBox(
                      height: 15.h,
                    ),
                    DefaultListView(
                        itemBuilder: (context, index) => const MainItemWidget(isbidding: true),
                        count: 10)
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
