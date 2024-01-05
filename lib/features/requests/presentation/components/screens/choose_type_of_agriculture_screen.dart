import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/default/empty_list.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/common/shared_radio_button.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/lists/presentation/controller/cubit/lists_cubit.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base_container.dart';
import 'package:hasad_app/features/requests/presentation/components/base/network_image.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';
import 'package:hasad_app/utils/helpers.dart';

class TypeOfAgricultureScreen extends StatelessWidget {
  const TypeOfAgricultureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRequestBaseScaffold(
        number: "5",
        title: "نوع الزراعة",
        body: BlocBuilder<AddRequestCubit, AddRequestState>(
          buildWhen: (a, b) => b is SelectAgricultureState,
          builder: (context, state) {
            AddRequestCubit cubit = AddRequestCubit.get(context);
            return AddRequestBaseContainer(
                buttonFunction: () {
                  if (cubit.selectedagriculture != null) {
                    cubit.pageController
                        .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                  } else {
                    showSnackbar(
                        context: context,
                        text: "من فضلك اختر نوع الزراعة",
                        state: ToastStates.ERROR);
                  }
                },
                body: BlocProvider(
                  create: (context) => sl<ListsCubit>()..getUnKnownList("agriculture-type"),
                  child: BlocBuilder<ListsCubit, ListsState>(
                    builder: (context, state) {
                      ListsCubit listCubit = ListsCubit.get(context);
                      if (state is GetUnKnownListLoadingState) {
                        return const LoadingWidget();
                      }
                      if (listCubit.unKnownList.isEmpty) {
                        return const EmptyList();
                      }
                      return DefaultListView(
                          itemBuilder: (ontext, index) => SharedCheckBoxButton(
                                title: isEmpty(listCubit.unKnownList[index].name),
                                image:
                                    RequestImageWidget(image: listCubit.unKnownList[index].image),
                                isSelected: cubit.selectedagriculture ==
                                    listCubit.unKnownList[index].id.toString(),
                                onChanged: (value) => cubit
                                    .selectagriculture(listCubit.unKnownList[index].id.toString()),
                              ),
                          count: listCubit.unKnownList.length);
                    },
                  ),
                ));
          },
        ));
  }
}
