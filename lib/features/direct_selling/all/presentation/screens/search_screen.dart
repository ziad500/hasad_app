import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/default/default_search_bar.dart';
import 'package:hasad_app/common/default/empty_list.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/main_item.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/cubit/direct_selling_list_dart_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class DirectSellingSearchScreen extends StatelessWidget {
  const DirectSellingSearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DirectSellingListCubit>(),
      child: BlocBuilder<DirectSellingListCubit, DirectSellingListState>(
        builder: (context, state) {
          DirectSellingListCubit cubit = DirectSellingListCubit.get(context);

          return DefaultScaffold(
              appbarTitle: LocaleKeys.search.tr(),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    DefaultSearchBar(
                      controller: cubit.searchController,
                      onFieldSubmitted: (value) {
                        cubit.directSellingListModel = null;
                        cubit.getDirectSellingList(isSearch: true);
                      },
                    ),
                    SizedBox(height: 20.h),
                    (state is GetDirectSellingListLoadingState)
                        ? const LoadingWidget()
                        : cubit.allDirectSelling.isEmpty
                            ? const Expanded(child: EmptyList(scrollable: true))
                            : DefaultListView(
                                itemBuilder: (context, index) => MainItemWidget(
                                    isbidding: false,
                                    directSellingDataModel: cubit.allDirectSelling[index]),
                                count: cubit.allDirectSelling.length)
                  ],
                ),
              ));
        },
      ),
    );
  }
}
