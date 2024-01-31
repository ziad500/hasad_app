import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/default_text.dart';

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget(
      {super.key,
      required this.subTitle,
      this.maxlines,
      this.color,
      this.fontWeight,
      this.fontSize});
  final String subTitle;
  final int? maxlines;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return DefaultText(
      text: subTitle,
      maxlines: maxlines,
      textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
          overflow: maxlines == null ? null : TextOverflow.ellipsis,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}
