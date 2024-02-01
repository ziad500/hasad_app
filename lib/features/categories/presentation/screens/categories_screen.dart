import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_grid_view.dart';
import 'package:hasad_app/common/default/empty_list.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/categories/presentation/components/category_item.dart';
import 'package:hasad_app/features/categories/presentation/controller/cubit/categories_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.type});
  final int type;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appbarTitle:
          type == 1 ? LocaleKeys.directSaleCategories.tr() : LocaleKeys.auctionCategories.tr(),
      body: BlocProvider(
        create: (context) => sl<CategoriesCubit>()..getCategories(),
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            CategoriesCubit cubit = CategoriesCubit.get(context);
            if (state is GetCategoriesLoadingState) {
              return const LoadingWidget();
            }
            if (cubit.categories.isEmpty) {
              return const EmptyList();
            }
            return DefaultGridView(
                length: cubit.categories.length,
                childBuilder: (index) =>
                    CategoriMainItem(type: type, categoryListModel: cubit.categories[index]));
          },
        ),
      ),
    );
  }
}
