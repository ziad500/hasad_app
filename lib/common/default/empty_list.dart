import 'default_text.dart';
import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key, this.title1, this.title2});
  final String? title1;
  final String? title2;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [DefaultText(text: "no more")],
      ),
    );
  }
}
