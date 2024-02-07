import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_form_field.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/common/shared_list_tile.dart';
import 'package:hasad_app/common/title_widget.dart';
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
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return LoadingFrame(
      loadingStates: [
        BlocBuilder<AddRequestCubit, AddRequestState>(
          builder: (context, state) {
            if (state is AddRequestLoadingState || state is EditRequestLoadingState) {
              return const LoadingPage();
            }
            return const SizedBox();
          },
        )
      ],
      child: AddRequestBaseScaffold(
          number: "9",
          title: AddRequestCubit.get(context).selectedType == 2
              ? LocaleKeys.auctionRemainingDetails.tr()
              : LocaleKeys.remainingAdvertisementDetails.tr(),
          body: BlocConsumer<AddRequestCubit, AddRequestState>(
            buildWhen: (a, b) => b is SelectBiddingDateState,
            listener: (context, state) {
              if (state is AddRequestErrorState) {
                showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
              }
              if (state is AddRequestSuccessState) {
                AddRequestCubit.get(context)
                    .pageController
                    .nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
              }
              if (state is EditRequestErrorState) {
                showSnackbar(context: context, text: state.error, state: ToastStates.ERROR);
              }
              if (state is EditRequestSuccessState) {
                Navigator.pop(context, true);
                showSnackbar(context: context, text: state.message, state: ToastStates.SUCCESS);
              }
            },
            builder: (context, state) {
              AddRequestCubit cubit = AddRequestCubit.get(context);
              return AddRequestBaseContainer(
                  buttonText: LocaleKeys.sendForReview.tr(),
                  buttonFunction: () {
                    if (formKey.currentState!.validate()) {
                      if (cubit.editId != null) {
                        cubit.editRequest(cubit.editId!);
                      } else {
                        cubit.addRequest();
                      }
                    }
                  },
                  body: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultFormField(
                              borderRadius: 3,
                              controller: cubit.titleController,
                              title: cubit.selectedType == 2
                                  ? LocaleKeys.addAuctionTitle.tr()
                                  : LocaleKeys.advertisementTitle.tr(),
                              hint: cubit.selectedType == 2
                                  ? LocaleKeys.addBriefAuctionTitle.tr()
                                  : LocaleKeys.addBriefDescription.tr(),
                              validator: defaultValidation),
                          const SizedBox(height: 16),
                          DefaultFormField(
                              borderRadius: 3,
                              controller: cubit.descriptionController,
                              title: LocaleKeys.description.tr(),
                              maxLines: 3,
                              hint: cubit.selectedType == 2
                                  ? LocaleKeys.describeAuctionHere.tr()
                                  : LocaleKeys.describeAdvertisementHere.tr(),
                              validator: defaultValidation),
                          const SizedBox(height: 16),
                          AddressDropDown(
                              title: cubit.selectedType == 1
                                  ? LocaleKeys.advertisementLocation.tr()
                                  : LocaleKeys.auctionLocation.tr(),
                              provinceController: cubit.provinceController,
                              cityController: cubit.cityController,
                              districtController: cubit.districtController),
                          const SizedBox(height: 16),
                          _BiddingPriceWidget(cubit: cubit),
                          const SizedBox(height: 16),
                          if (cubit.selectedType == 2) ...[
                            _SelectDate(cubit: cubit),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                DefaultFormField(
                                  borderRadius: 3,
                                  controller: cubit.biddingLongController,
                                  hint: LocaleKeys.auctionDuration.tr(),
                                  title: LocaleKeys.auctionDuration.tr(),
                                  validator: defaultValidation,
                                  width: 150.w,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Center(child: TitleWidget(title: LocaleKeys.hour.tr()))
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ));
            },
          )),
    );
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
          LocaleKeys.auctionDate.tr(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: 5,
        ),
        SharedListTile(
          borderRadius: 3,
          dense: true,
          title: cubit.selectedbiddingDate ?? LocaleKeys.auctionDate.tr(),
          isSelected: false,
          trailing: const SizedBox(),
          leading: const Icon(
            Icons.date_range_outlined,
            color: AppColors.primaryColor,
          ),
          onTap: () => showDatePickerFunction(context).then((date) => date == null
              ? null
              : showTimePickerFunction(context).then((time) => time == null
                  ? null
                  : cubit.selectbiddingDate(
                      "${date.year}-${date.month}-${date.day} ${time.hour}:${time.minute}"))),
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
                      controller: cubit.startPriceController,
                      title: LocaleKeys.initialPriceForAuction.tr(),
                      hint: LocaleKeys.startingPriceForAuction.tr(),
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
            title: LocaleKeys.price.tr(),
            hint: LocaleKeys.sellingPrice.tr(),
            validator: defaultValidation)
        : Expanded(
            child: DefaultFormField(
                borderRadius: 3,
                width: double.infinity,
                controller: cubit.defaultPriceController,
                textInputType: TextInputType.number,
                title: LocaleKeys.directPurchasePrice.tr(),
                hint: LocaleKeys.directPurchasePrice.tr(),
                validator: defaultValidation),
          );
  }
}
