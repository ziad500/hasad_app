import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/default_text_button.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/generated/app_strings.g.dart';

class RowOfTextViewAllWidget extends StatelessWidget {
  const RowOfTextViewAllWidget({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: TitleWidget(title: title)),
        DefaultTextButton(
          onPressed: onPressed,
          text: LocaleKeys.viewall.tr(),
          textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.blue),
        ),
      ],
    );
  }
}
