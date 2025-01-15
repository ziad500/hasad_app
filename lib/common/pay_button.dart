import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/default_button.dart';
import 'package:hasad_app/generated/app_strings.g.dart';
import 'package:hasad_app/utils/routes_manager.dart';

class PayButton extends StatelessWidget {
  const PayButton({super.key, required this.value, required this.isLoading, required this.url});
  final String value;
  final bool isLoading;
  final String url;
  @override
  Widget build(BuildContext context) {
    return DefaultButton(
        buttonName: "${LocaleKeys.pay.tr()} $value ${LocaleKeys.saudiRiyal.tr()}",
        isLoading: isLoading,
        buttonFunction: () async {
          Navigator.pushNamed(context, Routes.globalPaymentRoutes, arguments: {
            "url": url,
            "value": value,
          });
        });
  }
}
