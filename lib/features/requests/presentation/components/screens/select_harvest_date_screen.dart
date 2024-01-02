import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/shared_list_tile.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base_container.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/date_helper.dart';

class SelectHarvestDateScreen extends StatelessWidget {
  const SelectHarvestDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRequestBaseScaffold(
        number: "7",
        title: "تاريخ القطف",
        body: BlocBuilder<AddRequestCubit, AddRequestState>(
          buildWhen: (a, b) => b is SelectHarvestDateState,
          builder: (context, state) {
            AddRequestCubit cubit = AddRequestCubit.get(context);
            return AddRequestBaseContainer(
                buttonFunction: () {
                  cubit.pageController
                      .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                },
                body: Column(
                  children: [
                    SharedListTile(
                      dense: true,
                      title: cubit.selectedHarvestDate ?? "بيع مباشر",
                      isSelected: false,
                      trailing: const SizedBox(),
                      leading: const Icon(
                        Icons.date_range_outlined,
                        color: AppColors.primaryColor,
                      ),
                      onTap: () => showDatePickerFunction(context).then(
                          (value) => cubit.selectHarvestDate(formatDateString(value.toString()))),
                    ),
                  ],
                ));
          },
        ));
  }
}
