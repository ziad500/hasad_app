import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/default_text.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title, this.size, this.color});
  final String title;
  final double? size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return DefaultText(
      text: title,
      textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: size, color: color),
    );
  }
}
