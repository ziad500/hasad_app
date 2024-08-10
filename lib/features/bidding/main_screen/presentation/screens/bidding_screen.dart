import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/bidding/all/presentation/components/bidding_list.dart';
import 'package:hasad_app/features/bidding/all/presentation/controller/cubit/bidding_list_dart_cubit.dart';
import 'package:hasad_app/features/bidding/main_screen/presentation/components/search_notification_bar.dart';
import 'package:hasad_app/features/categories/presentation/components/category_list.dart';
import 'package:hasad_app/features/slider/presentation/components/slider.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';

class BiddingScreen extends StatelessWidget {
  const BiddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BiddingListCubit>()
        ..setType(Constants.token != "" ? biddingAboutToEnd : "all-about-to-end")
        ..getBiddingList(),
      child: Scaffold(
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
                      const CategoriesList(type: 2),
                      SizedBox(
                        height: 20.h,
                      ),
                      TitleWidget(title: LocaleKeys.auctionsEndingSoon.tr()),
                      SizedBox(
                        height: 15.h,
                      ),
                      const BiddingListView(useExpanded: false),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
