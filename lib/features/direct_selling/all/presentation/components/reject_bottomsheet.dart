import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/orders/cubit/direct_selling_orders_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/validation.dart';

class DirectSellingRejectOrderBottomSheet extends StatefulWidget {
  const DirectSellingRejectOrderBottomSheet(
      {Key? key, required this.directSellingOrdersCubit, required this.purchaseInvoiceId})
      : super(key: key);
  final DirectSellingOrdersCubit directSellingOrdersCubit;
  final String purchaseInvoiceId;

  @override
  State<DirectSellingRejectOrderBottomSheet> createState() =>
      _DirectSellingRejectOrderBottomSheetState();
}

class _DirectSellingRejectOrderBottomSheetState extends State<DirectSellingRejectOrderBottomSheet> {
  final TextEditingController _reasonController = TextEditingController();

  ValueNotifier<bool> otherSelected = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.directSellingOrdersCubit,
      child: BlocBuilder<DirectSellingOrdersCubit, DirectSellingOrdersState>(
        builder: (context, state) {
          DirectSellingOrdersCubit cubit = DirectSellingOrdersCubit.get(context);
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                    onPressed: () {
                      cubit.confirmOrder(widget.purchaseInvoiceId, "3", "منتجات تالفه");
                      Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        TitleWidget(title: "منتجات تالفه"),
                      ],
                    )),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      cubit.confirmOrder(widget.purchaseInvoiceId, "3", "المماطلة بالتسليم");
                      Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        TitleWidget(title: "المماطلة بالتسليم"),
                      ],
                    )),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      cubit.confirmOrder(widget.purchaseInvoiceId, "3", "المنتجات غير مطابقة");
                      Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        TitleWidget(title: "المنتجات غير مطابقة"),
                      ],
                    )),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      otherSelected.value = !otherSelected.value;
                    },
                    child: const Row(
                      children: [
                        TitleWidget(title: "اخري"),
                      ],
                    )),
                ValueListenableBuilder<bool>(
                  valueListenable: otherSelected,
                  builder: (context, value, child) {
                    if (value) {
                      return Column(
                        children: [
                          TextFormField(
                            controller: _reasonController,
                            style: const TextStyle(fontSize: 15),
                            validator: defaultValidation,
                            maxLines: 4,
                            decoration: InputDecoration(
                              hintText: Constants.isArabic ? "سبب الرفض" : "Reject Reason",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.withOpacity(0.6),
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 15),
                          DefaultButton(
                              buttonName: LocaleKeys.send.tr(),
                              isLoading: state is ConfirmOrderLoadingState,
                              buttonFunction: () {
                                cubit.confirmOrder(
                                    widget.purchaseInvoiceId, "3", _reasonController.text);
                                Navigator.pop(context);
                              })
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
