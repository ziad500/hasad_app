import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/bidding/all/presentation/components/my_bidding_list.dart';
import 'package:hasad_app/features/bidding/all/presentation/controller/my_bidding_list/cubit/my_bidding_list_cubit.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/components/my_direct_selling_list.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/my_direct_selling_list/cubit/my_direct_selling_list_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';

class MyAdvertisementScreen extends StatelessWidget {
  const MyAdvertisementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: DefaultScaffold(
          appbarTitle: "الإعلانات",
          body: Column(
            children: [
              Container(
                height: 50.h,
                margin: const EdgeInsets.symmetric(horizontal: 20).w,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.addRequestContainerColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(26).w),
                child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: AppColors.addRequestContainerColor,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(26).w,
                        color: AppColors.addRequestContainerColor),
                    tabs: [
                      const Tab(
                        text: "مزاد",
                      ),
                      Tab(
                        text: LocaleKeys.directSale.tr(),
                      )
                    ]),
              ),
              Expanded(
                  child: TabBarView(children: [
                BlocProvider(
                  create: (context) => sl<MyBiddingListCubit>()..getBiddingList(),
                  child: const MyBiddingListView(),
                ),
                BlocProvider(
                  create: (context) => sl<MyDirectSellingListCubit>()..getDirectSellingList(),
                  child: const MyDirectSellingListView(),
                )
              ]))
            ],
          )),
    );
  }
}
