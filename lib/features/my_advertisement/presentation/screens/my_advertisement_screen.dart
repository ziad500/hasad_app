import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/shared_tabbar.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/bidding/all/presentation/components/my_bidding_list.dart';
import 'package:hasad_app/features/bidding/all/presentation/controller/my_bidding_list/cubit/my_bidding_list_cubit.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/components/my_direct_selling_list.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/my_direct_selling_list/cubit/my_direct_selling_list_cubit.dart';
import 'package:hasad_app/features/favorites/presentation/components/add_to_fav_loading.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class MyAdvertisementScreen extends StatelessWidget {
  const MyAdvertisementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingFrame(
      loadingStates: const [AddToFavLoading()],
      child: DefaultTabController(
        length: 2,
        child: DefaultScaffold(
            appbarTitle: LocaleKeys.ads.tr(),
            body: Column(
              children: [
                SharedTabBar(),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                    child: TabBarView(children: [
                  BlocProvider(
                    create: (context) => sl<MyBiddingListCubit>()..getBiddingList(),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: MyBiddingListView(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => sl<MyDirectSellingListCubit>()..getDirectSellingList(),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: MyDirectSellingListView(),
                    ),
                  )
                ]))
              ],
            )),
      ),
    );
  }
}
