import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/shared_tabbar.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/bidding/all/presentation/components/bidding_orders.dart';
import 'package:hasad_app/features/bidding/all/presentation/controller/orders/cubit/bidding_orders_cubit.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/components/direct_selling_orders.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/orders/cubit/direct_selling_orders_cubit.dart';
import 'package:hasad_app/features/favorites/presentation/components/add_to_fav_loading.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingFrame(
      loadingStates: const [
        AddToFavLoading(),
      ],
      child: DefaultTabController(
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
                    create: (context) => sl<BiddingOrdersCubit>()..getBiddingList(),
                    child: LoadingFrame(
                      loadingStates: [
                        BlocBuilder<BiddingOrdersCubit, BiddingOrdersState>(
                          builder: (context, state) {
                            if (state is BuyOrderAfterWinLoadingState ||
                                state is ConfirmBiddingOrderLoadingState) {
                              return const LoadingPage();
                            }
                            return const SizedBox();
                          },
                        )
                      ],
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: BiddingOrdersListView(),
                      ),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => sl<DirectSellingOrdersCubit>()..getDirectSellingList(),
                    child: LoadingFrame(
                      loadingStates: [
                        BlocBuilder<DirectSellingOrdersCubit, DirectSellingOrdersState>(
                          builder: (context, state) {
                            if (state is ConfirmOrderLoadingState) {
                              return const LoadingPage();
                            }
                            return const SizedBox();
                          },
                        )
                      ],
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: DirectSellingOrdersListView(),
                      ),
                    ),
                  )
                ]))
              ],
            )),
      ),
    );
  }
}
