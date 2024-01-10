import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/custom_appbar_filter.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/bidding/all/presentation/components/base/tab_bar.dart';
import 'package:hasad_app/features/bidding/all/presentation/components/bidding_list.dart';
import 'package:hasad_app/features/bidding/all/presentation/controller/cubit/bidding_list_dart_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class BiddingListScreen extends StatelessWidget {
  const BiddingListScreen({super.key, required this.categoryId, required this.categoryName});
  final String categoryId;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BiddingListCubit>()
        ..setDepartmentID(categoryId)
        ..setType(biddingStillAvailable)
        ..getBiddingList(),
      child: DefaultScaffold(
          withAppbar: false,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                BlocBuilder<BiddingListCubit, BiddingListState>(
                  builder: (context, state) {
                    return CustomAppbarWithFilter(
                        color: Colors.transparent,
                        name: categoryName,
                        onTap: () => Navigator.pushNamed(context, Routes.filterScreen, arguments: {
                              "buttonFunc": (value) async {
                                BiddingListCubit.get(context)
                                    .passGetMainListRequest(value)
                                    .then((value) {
                                  Navigator.pop(context);
                                  BiddingListCubit.get(context).getBiddingList();
                                });
                              }
                            }));
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<BiddingListCubit, BiddingListState>(
                  buildWhen: (a, b) => false,
                  builder: (context, state) {
                    BiddingListCubit cubit = BiddingListCubit.get(context);

                    return BiddingTabBarWidget(
                        onTap: (value) {
                          cubit.reset();
                          cubit.setDepartmentID(categoryId);
                          cubit.setType(value);
                          cubit.getBiddingList();
                        },
                        list: [
                          TabBarModel(
                              icon: SVGManager.timer, title: LocaleKeys.biddingAboutToEnd.tr()),
                          TabBarModel(
                              icon: SVGManager.repeat,
                              title: LocaleKeys.biddingStillAvailable.tr()),
                          TabBarModel(
                              icon: SVGManager.calendar, title: LocaleKeys.biddingupcoming.tr())
                        ]);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Expanded(child: BiddingListView())
              ],
            ),
          )),
    );
  }
}
