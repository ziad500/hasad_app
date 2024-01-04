import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/expanded_container.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableItem(
        baseWidget: (value) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultText(
                text: "الوصف",
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
          text:
              "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربىهذا النص هو ",
          textStyle: Theme.of(context).textTheme.bodySmall,
        ));
  }
}
