import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/title_widget.dart';

class AddRequestBaseScaffold extends StatelessWidget {
  const AddRequestBaseScaffold(
      {super.key, required this.number, required this.title, required this.body});
  final String number;
  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        titleWidget: Column(
          children: [
            TitleWidget(title: number),
            DefaultText(
              text: title,
              textStyle: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        body: body);
  }
}
