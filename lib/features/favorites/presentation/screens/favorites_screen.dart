import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/shared_tabbar.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/favorites/presentation/components/bidding_list.dart';
import 'package:hasad_app/features/favorites/presentation/components/direct_selling_list.dart';
import 'package:hasad_app/features/favorites/presentation/controller/cubit/favorites_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (context) => sl<FavoritesCubit>()..getFavoritesList(),
        child: DefaultScaffold(
            appbarTitle: LocaleKeys.favorites.tr(),
            body: Column(
              children: [
                const SharedTabBar(),
                SizedBox(
                  height: 20.h,
                ),
                const Expanded(
                    child: TabBarView(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: BiddingFavListView(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DirectSellingFavListView(),
                  ),
                ]))
              ],
            )),
      ),
    );
  }
}
