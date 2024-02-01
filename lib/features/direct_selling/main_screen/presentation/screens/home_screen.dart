import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/row_of_text.dart';
import 'package:hasad_app/common/search_bar.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/categories/presentation/components/category_list.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/components/direct_selling_list.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/cubit/direct_selling_list_dart_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DirectSellingListCubit>()..getDirectSellingList(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchBarWidget(),
                RowOfTextViewAllWidget(
                    title: LocaleKeys.directSaleCategories.tr(), onPressed: () {}),
                SizedBox(
                  height: 5.h,
                ),
                const CategoriesList(type: 1),
                SizedBox(
                  height: 20.h,
                ),
                TitleWidget(title: LocaleKeys.recentlyAdded.tr()),
                SizedBox(
                  height: 15.h,
                ),
                const DirectSellingListView(
                  expanded: false,
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
