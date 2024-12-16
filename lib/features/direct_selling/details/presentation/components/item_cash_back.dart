import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hasad_app/common/icon_and_text_widget.dart';
import 'package:hasad_app/features/direct_selling/all/domain/models/direct_selling_models.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class ItemCashBackWidget extends StatelessWidget {
  const ItemCashBackWidget({super.key, required this.directSellingDataModel});
  final DirectSellingDataModel? directSellingDataModel;

  @override
  Widget build(BuildContext context) {
    return (directSellingDataModel?.cashbackPercentage == null ||
            directSellingDataModel?.cashbackPercentage == "")
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              IconAndText(
                  color: Colors.green,
                  svg: "",
                  svgWidget: const Icon(
                    Icons.attach_money_outlined,
                    color: Colors.green,
                  ),
                  title:
                      "${directSellingDataModel?.cashbackPercentage ?? 0} % - ${LocaleKeys.cashBack.tr()}"),
            ],
          );
  }
}
