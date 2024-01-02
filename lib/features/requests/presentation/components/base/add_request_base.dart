import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/default_text.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/requests/presentation/controller/cubit/add_request_cubit.dart';

class AddRequestBaseScaffold extends StatelessWidget {
  const AddRequestBaseScaffold(
      {super.key,
      required this.number,
      required this.title,
      required this.body,
      this.backFunction});
  final String number;
  final String title;
  final Widget body;
  final void Function()? backFunction;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        back: true,
        backFunction: backFunction ??
            () => AddRequestCubit.get(context)
                .pageController
                .previousPage(duration: const Duration(milliseconds: 500), curve: Curves.ease),
        titleWidget: Column(
          children: [
            TitleWidget(
              title: number,
              size: 18,
            ),
            DefaultText(
              text: title,
              textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
            )
          ],
        ),
        body: body);
  }
}
