import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/expanded_container.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.desc});
  final String desc;

  @override
  Widget build(BuildContext context) {
    return ExpandableItem(
        baseWidget: (value) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultText(
                text: LocaleKeys.description.tr(),
                textStyle: Theme.of(context).textTheme.titleMedium,
              ),
              value
                  ? const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Colors.black,
                    )
            ],
          );
        },
        expandedWidget: DefaultText(
          text: desc,
          textStyle: Theme.of(context).textTheme.bodySmall,
        ));
  }
}
