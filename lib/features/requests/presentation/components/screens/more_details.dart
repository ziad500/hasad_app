import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/custom_drop_down.dart';
import 'package:hasad_app/common/default/default_form_field.dart';
import 'package:hasad_app/common/shared_list_tile.dart';
import 'package:hasad_app/features/lists/presentation/components/address_drop_down.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base_container.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/date_helper.dart';
import 'package:hasad_app/utils/validation.dart';

class MoreDetailsScreen extends StatelessWidget {
  const MoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRequestBaseScaffold(
        number: "9",
        title: AddRequestCubit.get(context).selectedType == 2
            ? "باقى تفاصيل المزاد"
            : "باقى تفاصيل الإعلان",
        body: BlocBuilder<AddRequestCubit, AddRequestState>(
          buildWhen: (a, b) => b is SelectBiddingDateState,
          builder: (context, state) {
            AddRequestCubit cubit = AddRequestCubit.get(context);
            return AddRequestBaseContainer(
                buttonText: "إرسال للمراجعة",
                buttonFunction: () {
                  cubit.pageController
                      .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                },
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultFormField(
                          borderRadius: 3,
                          controller: cubit.titleController,
                          title: "أضف عنوان للمزاد",
                          hint: "أضف عنوان مختصر للمزاد .... ",
                          validator: defaultValidation),
                      const SizedBox(
                        height: 16,
                      ),
                      DefaultFormField(
                          borderRadius: 3,
                          controller: cubit.descriptionController,
                          title: "الوصف",
                          maxLines: 3,
                          hint: "يمكنك وصف المزاد هنا ...",
                          validator: defaultValidation),
                      const SizedBox(
                        height: 16,
                      ),
                      AddressDropDown(
                          title: cubit.selectedType == 1
                              ? LocaleKeys.advertisementLocation.tr()
                              : LocaleKeys.auctionLocation.tr(),
                          provinceController: cubit.provinceController,
                          cityController: cubit.cityController,
                          districtController: cubit.districtController),
                      const SizedBox(
                        height: 16,
                      ),
                      _BiddingPriceWidget(cubit: cubit),
                      const SizedBox(
                        height: 16,
                      ),
                      if (cubit.selectedType == 2) ...[
                        _SelectDate(
                          cubit: cubit,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomDropDown(
                            list: [],
                            title: "يستمر المزاد لمدة",
                            hint: "يستمر المزاد لمدة",
                            width: 150.w,
                            onOptionSelected: (value) {})
                      ],
                    ],
                  ),
                ));
          },
        ));
  }
}

class _SelectDate extends StatelessWidget {
  const _SelectDate({required this.cubit});
  final AddRequestCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "تاريخ المزاد",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: 5,
        ),
        SharedListTile(
          borderRadius: 3,
          dense: true,
          title: cubit.selectedbiddingDate ?? "تاريخ المزاد",
          isSelected: false,
          trailing: const SizedBox(),
          leading: const Icon(
            Icons.date_range_outlined,
            color: AppColors.primaryColor,
          ),
          onTap: () => showDatePickerFunction(context).then((value) =>
              value == null ? null : cubit.selectbiddingDate(formatDateString(value.toString()))),
        ),
      ],
    );
  }
}

class _BiddingPriceWidget extends StatelessWidget {
  const _BiddingPriceWidget({required this.cubit});
  final AddRequestCubit cubit;
  @override
  Widget build(BuildContext context) {
    return cubit.selectedType == 2
        ? Row(
            children: [
              if (cubit.selectedType == 2) ...[
                Expanded(
                  child: DefaultFormField(
                      borderRadius: 3,
                      controller: cubit.biddingPriceController,
                      title: "السعر الإبتدائى للمزاد",
                      hint: "سعر بداية المزاد",
                      textInputType: TextInputType.number,
                      validator: defaultValidation),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
              _SelectPrice(cubit: cubit)
            ],
          )
        : _SelectPrice(cubit: cubit);
  }
}

class _SelectPrice extends StatelessWidget {
  const _SelectPrice({required this.cubit});
  final AddRequestCubit cubit;

  @override
  Widget build(BuildContext context) {
    return cubit.selectedType == 1
        ? DefaultFormField(
            borderRadius: 3,
            width: 150.w,
            controller: cubit.defaultPriceController,
            textInputType: TextInputType.number,
            title: "السعر",
            hint: "سعر البيع",
            validator: defaultValidation)
        : Expanded(
            child: DefaultFormField(
                borderRadius: 3,
                width: double.infinity,
                controller: cubit.defaultPriceController,
                textInputType: TextInputType.number,
                title: "سعر الشراء المباشر",
                hint: "سعر الشراءالمباشر",
                validator: defaultValidation),
          );
  }
}
