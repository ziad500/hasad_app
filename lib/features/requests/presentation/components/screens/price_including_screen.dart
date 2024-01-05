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

class PriceIncludingScreen extends StatelessWidget {
  const PriceIncludingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRequestBaseScaffold(
        number: "4",
        title: "يشمل السعر",
        body: BlocBuilder<AddRequestCubit, AddRequestState>(
          buildWhen: (a, b) => b is SelectPriceIncludingState,
          builder: (context, state) {
            AddRequestCubit cubit = AddRequestCubit.get(context);
            return AddRequestBaseContainer(
                buttonFunction: () {
                  if (cubit.selectedPriceIncluding.isNotEmpty) {
                    cubit.pageController
                        .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                  } else {
                    showSnackbar(
                        context: context,
                        text: "من فضلك اختر ما يشملة السعر",
                        state: ToastStates.ERROR);
                  }
                },
                body: BlocProvider(
                  create: (context) => sl<ListsCubit>()..getUnKnownList("price-inclusion"),
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
                                isSelected: cubit.selectedPriceIncluding
                                    .contains(listCubit.unKnownList[index].id.toString()),
                                onChanged: (value) => cubit.selectPriceIncluding(
                                    listCubit.unKnownList[index].id.toString()),
                              ),
                          count: listCubit.unKnownList.length);
                    },
                  ),
                ));
          },
        ));
  }
}
