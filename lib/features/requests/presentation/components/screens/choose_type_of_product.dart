import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/category_item.dart';
import 'package:hasad_app/common/default/empty_list.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/categories/presentation/controller/cubit/categories_cubit.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base_container.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class ChooseTypeOfProductScreen extends StatelessWidget {
  const ChooseTypeOfProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRequestBaseScaffold(
        number: "3",
        title: LocaleKeys.pleaseSelectType.tr(),
        body: BlocBuilder<AddRequestCubit, AddRequestState>(
          buildWhen: (a, b) => b is SelectTypeOfProductState,
          builder: (context, state) {
            AddRequestCubit cubit = AddRequestCubit.get(context);
            return AddRequestBaseContainer(
                buttonFunction: () {
                  if (cubit.selectedTypeOfProduct != null) {
                    cubit.pageController
                        .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                  } else {
                    showSnackbar(
                        context: context,
                        text: LocaleKeys.pleaseSelectSectionType.tr(),
                        state: ToastStates.ERROR);
                  }
                },
                body: BlocProvider(
                  create: (context) => sl<CategoriesCubit>()
                    ..getCategoriesTypes(cubit.selectedDepartment.toString()),
                  child: BlocBuilder<CategoriesCubit, CategoriesState>(
                    builder: (context, state) {
                      CategoriesCubit categoryCubit = CategoriesCubit.get(context);
                      if (state is GetCategoriesTypesLoadingState) {
                        return const LoadingWidget();
                      }
                      if (categoryCubit.categoriesTypes.isEmpty) {
                        return const EmptyList();
                      }
                      return Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: categoryCubit.categoriesTypes
                            .map((e) => CategoryItem(
                                  categoryListModel: e,
                                  width: 90.w,
                                  height: 90.h,
                                ))
                            .toList(),
                      );
                      /*               DefaultListView(
                          itemBuilder: (ontext, index) => SharedListTile(
                                leading: RequestImageWidget(
                                    image: categoryCubit.categoriesTypes[index].image),
                                large: true,
                                title: isEmpty(categoryCubit.categoriesTypes[index].name),
                                isSelected: cubit.selectedTypeOfProduct ==
                                    categoryCubit.categoriesTypes[index].id,
                                onTap: () => cubit.selectTypeOfProduct(
                                    int.parse(categoryCubit.categoriesTypes[index].id.toString())),
                              ),
                          count: categoryCubit.categoriesTypes.length);
         */
                    },
                  ),
                ));
          },
        ));
  }
}
