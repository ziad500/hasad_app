import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_divider.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/shared_list_tile.dart';
import 'package:hasad_app/features/direct_selling/all/data/network/requests.dart';
import 'package:hasad_app/features/filter/presentation/components/agriculture_type_filter.dart';
import 'package:hasad_app/features/filter/presentation/components/packaging_type_filter.dart';
import 'package:hasad_app/features/filter/presentation/controller/cubit/filter_cubit.dart';
import 'package:hasad_app/features/lists/presentation/components/main_lists.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/date_helper.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key, required this.buttonFunc});
  final Function(GetMainListRequest) buttonFunc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit(),
      child: DefaultScaffold(
          appbarTitle: "فلتر",
          body: Column(
            children: [
              const DefaultDivider(),
              BlocBuilder<FilterCubit, FilterState>(
                builder: (context, state) {
                  FilterCubit cubit = FilterCubit.get(context);
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const AgricultureFilter(),
                          SizedBox(
                            height: 10.h,
                          ),
                          const PackagingFilter(),
                          SizedBox(
                            height: 10.h,
                          ),
                          _SelectHarvestDate(cubit: cubit),
                          SizedBox(
                            height: 10.h,
                          ),
                          AddressMainDropDown(
                              provinceController: cubit.provinceController,
                              cityController: cubit.cityController,
                              districtController: cubit.districtController),
                          SizedBox(
                            height: 20.h,
                          ),
                          DefaultButton(
                              buttonName: LocaleKeys.done.tr(),
                              buttonFunction: () {
                                buttonFunc(cubit.passFilterRequest());
                              })
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          )),
    );
  }
}

class _SelectHarvestDate extends StatelessWidget {
  const _SelectHarvestDate({required this.cubit});
  final FilterCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.harvestDate.tr(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.primaryColor),
        ),
        const SizedBox(
          height: 10,
        ),
        SharedListTile(
          dense: true,
          borderRadius: 17,
          title: cubit.selectedHarvestDate ?? LocaleKeys.selectDate.tr(),
          isSelected: false,
          trailing: const SizedBox(),
          leading: const Icon(
            Icons.date_range_outlined,
            color: AppColors.primaryColor,
          ),
          onTap: () => showDatePickerFunction(context).then((value) =>
              value == null ? null : cubit.selectHarvestDate(formatDateString(value.toString()))),
        ),
      ],
    );
  }
}
