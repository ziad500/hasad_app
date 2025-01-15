import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/common/pay_button.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/orders/cubit/direct_selling_orders_cubit.dart';
import 'package:hasad_app/features/requests/presentation/components/screens/payment_widget.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class ChoosePaymentMethodBottomSheet extends StatelessWidget {
  const ChoosePaymentMethodBottomSheet(
      {Key? key,
      required this.directSellingOrdersCubit,
      required this.purchaseInvoiceId,
      required this.value})
      : super(key: key);
  final DirectSellingOrdersCubit directSellingOrdersCubit;
  final String purchaseInvoiceId;
  final String value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: directSellingOrdersCubit,
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
            child: cubit.paymentUrlResult != null
                ? Column(
                    children: [
                      if (cubit.paymentQrResult != null) ...[
                        Image.network(cubit.paymentQrResult!),
                        const SizedBox(height: 20),
                        PayButton(value: value, isLoading: false, url: cubit.paymentUrlResult!)
                      ],
                      if (cubit.paymentUrlResult != null && cubit.paymentQrResult == null) ...[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () {
                                copyToClipboard(context, cubit.paymentUrlResult ?? "");
                              },
                            )
                          ],
                        ),
                        DefaultText(text: cubit.paymentUrlResult ?? "", color: Colors.blue),
                        const SizedBox(height: 20),
                        PayButton(value: value, isLoading: false, url: cubit.paymentUrlResult!)
                      ]
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TitleWidget(
                        title: LocaleKeys.choosePaymentMethod.tr(),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: PaymentMethodWidget(
                                onTap: () {
                                  cubit.selectedPaymentMethodFunc(3);
                                },
                                defaultIsSelected: cubit.selectedPaymentMethod == 3,
                                name: LocaleKeys.link.tr(),
                                id: "3",
                                icon: const Icon(
                                  Icons.link,
                                  size: 50,
                                )),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: PaymentMethodWidget(
                                onTap: () {
                                  cubit.selectedPaymentMethodFunc(1);
                                },
                                defaultIsSelected: cubit.selectedPaymentMethod == 1,
                                name: LocaleKeys.wallet.tr(),
                                id: "1",
                                icon: const Icon(
                                  Icons.wallet,
                                  size: 50,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: PaymentMethodWidget(
                                onTap: () {
                                  cubit.selectedPaymentMethodFunc(2);
                                },
                                defaultIsSelected: cubit.selectedPaymentMethod == 2,
                                name: LocaleKeys.qrCode.tr(),
                                id: "2",
                                icon: const Icon(
                                  Icons.qr_code_2,
                                  size: 50,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      DefaultButton(
                          buttonName: LocaleKeys.send.tr(),
                          isLoading: state is ReCompleteOrderPaymentLoadingState,
                          buttonFunction: () async {
                            await cubit.reCompleteOrderPayment(
                                purchaseInvoiceId, cubit.selectedPaymentMethod.toString());
                            if (cubit.selectedPaymentMethod == 1) {
                              Navigator.pop(context);
                            }
                          }),
                      const SizedBox(height: 20),
                    ],
                  ),
          );
        },
      ),
    );
  }

  bool isNetworkImage(String url) {
    final Uri? uri = Uri.tryParse(url);
    final List<String> imageExtensions = ['.png', '.jpg', '.jpeg', '.gif', '.svg', '.webp'];

    // Check if the URL is valid and starts with http/https
    if (uri != null && (uri.isScheme('http') || uri.isScheme('https'))) {
      // Check if the URL ends with an image file extension
      return imageExtensions.any((ext) => url.toLowerCase().endsWith(ext));
    }
    return false;
  }

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      showSnackbar(context: context, text: 'Copied to clipboard!', state: ToastStates.SUCCESS);
    });
  }
}
