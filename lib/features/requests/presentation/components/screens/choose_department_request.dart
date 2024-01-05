import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/category_item.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/default/empty_list.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/categories/presentation/controller/cubit/categories_cubit.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class ChooseDepartmentRequestScreen extends StatelessWidget {
  const ChooseDepartmentRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRequestBaseScaffold(
        number: "2",
        title: LocaleKeys.pleaseSelectSection.tr(),
        body: BlocBuilder<AddRequestCubit, AddRequestState>(
          buildWhen: (a, b) => b is SelectDepartmentState,
          builder: (context, state) {
            AddRequestCubit cubit = AddRequestCubit.get(context);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // ignore: prefer_const_constructors
                  _CategoriesList(),
                  SizedBox(
                    height: 10.h,
                  ),
                  DefaultButton(
                      buttonName: LocaleKeys.next.tr(),
                      buttonFunction: () {
                        if (cubit.selectedDepartment != null) {
                          cubit.pageController.nextPage(
                              duration: const Duration(milliseconds: 500), curve: Curves.ease);
                        } else {
                          showSnackbar(
                              context: context,
                              text: LocaleKeys.pleaseSelectSection.tr(),
                              state: ToastStates.ERROR);
                        }
                      }),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            );
          },
        ));
  }
}

class _CategoriesList extends StatelessWidget {
  const _CategoriesList();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
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
            return Container(
                width: 200.w,
                padding: const EdgeInsets.all(20),
                child: DefaultListView(
                    itemBuilder: (context, index) =>
                        CategoryItem(categoryListModel: cubit.categories[index]),
                    count: cubit.categories.length));
          },
        ),
      ),
    );
  }
}
