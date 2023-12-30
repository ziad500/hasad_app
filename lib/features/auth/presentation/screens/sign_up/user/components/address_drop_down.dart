/* import '../../../../../../../../utils/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../common/deafult/custom_drop_down.dart';
import '../../../../../../../../common/deafult/loading_widget.dart';
import '../../../../../../../../common/deafult/show_toast.dart';
import '../../../../../../../../utils/helpers.dart';
import '../../../../../../lists/data/network/requests.dart';
import '../../../../../../lists/presentation/controller/cubit/lists_cubit.dart';

class AddressDropDown extends StatelessWidget {
  const AddressDropDown(
      {super.key,
      required this.regionController,
      required this.cityController,
      required this.districtController,
      this.region,
      this.city,
      this.district});
  final TextEditingController regionController;
  final TextEditingController cityController;
  final TextEditingController districtController;
  final String? region;
  final String? city;
  final String? district;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListsCubit, ListsState>(
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
              AppStrings.address.tr(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                (state is GetRegionsLoadingState)
                    ? const LoadingWidget()
                    : Expanded(
                        child: CustomDropDown(
                          list: ListsCubit.get(context).regionsModel == null
                              ? []
                              : ListsCubit.get(context)
                                  .regionsModel!
                                  .data!
                                  .map((e) =>
                                      OptionItem(id: e.id.toString(), title: isEmpty(e.name)))
                                  .toList(),
                          hint: (region != null) ? region.toString() : AppStrings.regions.tr(),
                          onOptionSelected: (p0) {
                            regionController.text = p0!.id;
                            cityController.clear();

                            districtController.clear();
                            ListsCubit.get(context)
                                .getCitisList(RegionsListRequest([int.parse(p0.id)]));
                            ListsCubit.get(context)
                                .getDitrictsList(RegionsListRequest([int.parse(p0.id)]));
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
                          list: ListsCubit.get(context).citiesModel == null
                              ? []
                              : ListsCubit.get(context)
                                  .citiesModel!
                                  .data!
                                  .map((e) =>
                                      OptionItem(id: e.id.toString(), title: isEmpty(e.name)))
                                  .toList(),
                          hint: (city != null) ? city.toString() : AppStrings.cityy.tr(),
                          onOptionSelected: (p0) {
                            cityController.text = p0!.id;
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
                    list: ListsCubit.get(context).districtsModel == null
                        ? []
                        : ListsCubit.get(context)
                            .districtsModel!
                            .data!
                            .map((e) => OptionItem(id: e.id.toString(), title: isEmpty(e.name)))
                            .toList(),
                    hint: (district != null) ? district.toString() : AppStrings.district.tr(),
                    onOptionSelected: (p0) {
                      districtController.text = p0!.id;
                    },
                    onTap: () {},
                  ),
          ],
        );
      },
    );
  }
}
 */