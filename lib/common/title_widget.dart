import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/default_text.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(
      {super.key, required this.title, this.size, this.color, this.fontWeight, this.maxlines});
  final String title;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxlines;
  @override
  Widget build(BuildContext context) {
    return DefaultText(
      text: title,
      maxlines: maxlines,
      textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
          overflow: maxlines != null ? TextOverflow.ellipsis : null),
    );
  }
}
