import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_form_field.dart';
import 'package:hasad_app/common/default/default_radio_button.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/common/shared_list_tile.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base_container.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/payment_Widget.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/date_helper.dart';
import 'package:hasad_app/utils/validation.dart';

class SelectHarvestDateScreen extends StatelessWidget {
  const SelectHarvestDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRequestBaseScaffold(
        number: "7",
        title: LocaleKeys.harvestDate.tr(),
        body: BlocBuilder<AddRequestCubit, AddRequestState>(
          buildWhen: (a, b) =>
              b is SelectHarvestDateState ||
              b is SelectQuantityTypeState ||
              b is SelectPaymentMethodState,
          builder: (context, state) {
            AddRequestCubit cubit = AddRequestCubit.get(context);
            return AddRequestBaseContainer(
                buttonFunction: () {
                  if (cubit.selectedHarvestDate != null) {
                    if (cubit.selectedType == 1) {
                      if (cubit.selectedQuantityType != null) {
                        if (cubit.selectedQuantityType == 1) {
                          if (cubit.quantityController.text != "") {
                            cubit.pageController.nextPage(
                                duration: const Duration(milliseconds: 500), curve: Curves.ease);
                          } else {
                            showSnackbar(
                                context: context,
                                text: LocaleKeys.enterQuantity.tr(),
                                state: ToastStates.ERROR);
                          }
                        } else {
                          cubit.pageController.nextPage(
                              duration: const Duration(milliseconds: 500), curve: Curves.ease);
                        }
                      } else {
                        showSnackbar(
                            context: context,
                            text: LocaleKeys.enterQuantity.tr(),
                            state: ToastStates.ERROR);
                      }
                    } else {
                      cubit.pageController.nextPage(
                          duration: const Duration(milliseconds: 500), curve: Curves.ease);
                    }
                  } else {
                    showSnackbar(
                        context: context,
                        text: LocaleKeys.selectHarvestDate.tr(),
                        state: ToastStates.ERROR);
                  }
                },
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SharedListTile(
                        dense: true,
                        title: cubit.selectedHarvestDate ?? LocaleKeys.selectDate.tr(),
                        isSelected: false,
                        trailing: const SizedBox(),
                        leading: const Icon(
                          Icons.date_range_outlined,
                          color: AppColors.primaryColor,
                        ),
                        onTap: () => showDatePickerFunction(context).then((value) => value == null
                            ? null
                            : cubit.selectHarvestDate(formatDateString(value.toString()))),
                      ),
                      if (cubit.selectedType == 2) ...[
                        const SizedBox(height: 16),
                        DefaultFormField(
                            enabled: cubit.selectedQuantityType == 1,
                            hint: LocaleKeys.enterQuantity.tr(),
                            textInputType: TextInputType.number,
                            controller: cubit.quantityController,
                            validator: defaultValidation)
                      ],
                      if (cubit.selectedType == 1) ...[
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: DefaultRadioButton(
                                color: Colors.black,
                                label: LocaleKeys.sellOne.tr(),
                                value: 2,
                                groupValue: cubit.selectedQuantityType,
                                onChanged: (value) {
                                  cubit.selectedQuantityTypeFunc(2);
                                  cubit.quantityController.text = "";
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: DefaultRadioButton(
                                color: Colors.black,
                                label: LocaleKeys.sellPieces.tr(),
                                value: 1,
                                groupValue: cubit.selectedQuantityType,
                                onChanged: (value) => cubit.selectedQuantityTypeFunc(1),
                              ),
                            ),
                          ],
                        ),
                        if (cubit.selectedQuantityType == 1) ...[
                          const SizedBox(height: 16),
                          DefaultFormField(
                              enabled: cubit.selectedQuantityType == 1,
                              hint: LocaleKeys.enterQuantity.tr(),
                              textInputType: TextInputType.number,
                              controller: cubit.quantityController,
                              validator: defaultValidation)
                        ],
                        if (cubit.selectedType == 1) ...[
                          const SizedBox(height: 16),
                          TitleWidget(title: LocaleKeys.choosePaymentMethod.tr()),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                  child: PaymentMethodWidget(
                                      onTap: () {
                                        cubit.selectedPaymentMethodFunc(1);
                                      },
                                      defaultIsSelected: cubit.selectedPaymentMethod == 1,
                                      name: LocaleKeys.paymentOnDelivery.tr(),
                                      id: "1",
                                      icon: const Icon(
                                        Icons.delivery_dining,
                                        size: 50,
                                      ))),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: PaymentMethodWidget(
                                      onTap: () {
                                        cubit.selectedPaymentMethodFunc(0);
                                      },
                                      defaultIsSelected: cubit.selectedPaymentMethod == 0,
                                      name: LocaleKeys.wallet.tr(),
                                      id: "0",
                                      icon: const Icon(
                                        Icons.wallet,
                                        size: 50,
                                      ))),
                            ],
                          ),
                        ]
                      ]
                    ],
                  ),
                ));
          },
        ));
  }
}
