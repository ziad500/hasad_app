import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/direct_selling/all/presentation/controller/orders/cubit/direct_selling_orders_cubit.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/main.dart';

import '../../../../../../common/default/show_toast.dart';

class AuthOrderBottomSheet extends StatelessWidget {
  AuthOrderBottomSheet(
      {Key? key, required this.directSellingOrdersCubit, required this.purchaseInvoiceId})
      : super(key: key);
  final DirectSellingOrdersCubit directSellingOrdersCubit;
  final String purchaseInvoiceId;

  final TextEditingController _codeController = TextEditingController();

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TitleWidget(
                  title: LocaleKeys.enterCode.tr(),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, letterSpacing: 8),
                  decoration: InputDecoration(
                    hintText: '______',
                    hintStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.grey.withOpacity(0.6),
                      letterSpacing: 8,
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                DefaultButton(
                    buttonName: LocaleKeys.done.tr(),
                    isLoading: state is AuthConfirmOrderLoadingState,
                    buttonFunction: () async {
                      String code = _codeController.text;
                      if (code.length == 6) {
                        await cubit.authConfirmOrder(purchaseInvoiceId, _codeController.text);
                        Navigator.pop(navigatorKey.currentContext!);
                      } else {
                        showSnackbar(
                            context: context,
                            text: LocaleKeys.enterCode.tr(),
                            state: ToastStates.ERROR);
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
}
