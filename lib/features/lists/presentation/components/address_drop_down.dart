import 'package:easy_localization/easy_localization.dart';
import 'package:hasad_app/common/default/custom_drop_down.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/core/di.dart';
import 'package:hasad_app/features/lists/data/network/requests.dart';
import 'package:hasad_app/features/lists/presentation/controller/cubit/lists_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../utils/helpers.dart';

class AddressDropDown extends StatelessWidget {
  const AddressDropDown(
      {super.key,
      required this.provinceController,
      required this.cityController,
      required this.districtController,
      this.region,
      this.city,
      this.district,
      this.title});
  final TextEditingController provinceController;
  final TextEditingController cityController;
  final TextEditingController districtController;
  final String? region;
  final String? city;
  final String? district;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ListsCubit>()
        ..getRegionsList()
        ..getCitisList(RegionsListRequest([int.parse(cityController.text)]),
            call: cityController.text != "")
        ..getDitrictsList(RegionsListRequest([int.parse(cityController.text)]),
            call: districtController.text != ""),
      child: BlocConsumer<ListsCubit, ListsState>(
        listener: (context, state) {
          if (state is GetRegionsErrorState) {
            showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
          }
          if (state is GetCitiesErrorState) {
            showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
          }
          if (state is GetDistrictsErrorState) {
            showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  (state is GetRegionsLoadingState)
                      ? const LoadingWidget()
                      : Expanded(
                          child: CustomDropDown(
                            initialValue:
                                ListsCubit.get(context).getRegionsValue(cityController.text),
                            list: ListsCubit.get(context).regionsModel == null
                                ? []
                                : ListsCubit.get(context)
                                    .regionsModel!
                                    .data!
                                    .map((e) =>
                                        OptionItem(id: e.id.toString(), title: isEmpty(e.name)))
                                    .toList(),
                            hint: (region != null) ? region.toString() : LocaleKeys.city.tr(),
                            onOptionSelected: (p0) {
                              cityController.text = p0!.id;
                              provinceController.clear();

                              districtController.clear();
                              ListsCubit.get(context)
                                  .getCitisList(RegionsListRequest([int.parse(p0.id)]), call: true);
                              ListsCubit.get(context).getDitrictsList(
                                  RegionsListRequest([int.parse(p0.id)]),
                                  call: true);
                            },
                            onTap: () {},
                          ),
                        ),
                  const SizedBox(
                    width: 20,
                  ),
                  (state is GetCitiesLoadingState || state is GetDistrictsLoadingState)
                      ? const LoadingWidget()
                      : Expanded(
                          child: CustomDropDown(
                            initialValue:
                                ListsCubit.get(context).getCityValue(provinceController.text),
                            list: ListsCubit.get(context).citiesModel == null
                                ? []
                                : ListsCubit.get(context)
                                    .citiesModel!
                                    .data!
                                    .map((e) =>
                                        OptionItem(id: e.id.toString(), title: isEmpty(e.name)))
                                    .toList(),
                            hint: (city != null) ? city.toString() : LocaleKeys.province.tr(),
                            onOptionSelected: (p0) {
                              provinceController.text = p0!.id;
                            },
                            onTap: () {},
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              (state is GetCitiesLoadingState || state is GetDistrictsLoadingState)
                  ? const LoadingWidget()
                  : CustomDropDown(
                      width: 135.w,
                      initialValue:
                          ListsCubit.get(context).getDitrictValue(districtController.text),
                      list: ListsCubit.get(context).districtsModel == null
                          ? []
                          : ListsCubit.get(context)
                              .districtsModel!
                              .data!
                              .map((e) => OptionItem(id: e.id.toString(), title: isEmpty(e.name)))
                              .toList(),
                      hint: (district != null) ? district.toString() : LocaleKeys.district.tr(),
                      onOptionSelected: (p0) {
                        districtController.text = p0!.id;
                      },
                      onTap: () {},
                    ),
            ],
          );
        },
      ),
    );
  }
}
