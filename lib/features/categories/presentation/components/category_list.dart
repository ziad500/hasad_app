import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/row_of_text.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/categories/presentation/components/category_item.dart';
import 'package:hasad_app/features/categories/presentation/controller/cubit/categories_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.type});
  final int type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoriesCubit>()..getCategories(),
      child: Column(
        children: [
          BlocBuilder<CategoriesCubit, CategoriesState>(
            buildWhen: (_, __) => false,
            builder: (context, state) {
              return RowOfTextViewAllWidget(
                  title: type == 1
                      ? LocaleKeys.directSaleCategories.tr()
                      : LocaleKeys.auctionCategories.tr(),
                  onPressed: () => Navigator.pushNamed(context, Routes.categoriesScreen,
                      arguments: {'type': type}));
            },
          ),
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                CategoriesCubit cubit = CategoriesCubit.get(context);
                if (state is GetCategoriesLoadingState) {
                  return const LoadingWidget();
                }
                if (cubit.categories.isEmpty) {
                  return const Text("لا يوجد اقسام");
                }
                return DefaultListView(
                    height: 110.h,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        CategoriMainItem(type: type, categoryListModel: cubit.categories[index]),
                    count: cubit.categories.length);
              },
            ),
          ),
        ],
      ),
    );
  }
}
