import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/shared_tabbar.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/bidding/all/presentation/components/my_bidding_list.dart';
import 'package:hasad_app/features/bidding/all/presentation/controller/my_bidding_list/cubit/my_bidding_list_cubit.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/components/direct_selling_orders.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/orders/cubit/direct_selling_orders_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: DefaultScaffold(
          appbarTitle: LocaleKeys.orders.tr(),
          body: Column(
            children: [
              const SharedTabBar(),
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
                  create: (context) => sl<DirectSellingOrdersCubit>()..getDirectSellingList(),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DirectSellingOrdersListView(),
                  ),
                )
              ]))
            ],
          )),
    );
  }
}
