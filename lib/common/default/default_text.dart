import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  const DefaultText(
      {super.key,
      required this.text,
      this.fontSize,
      this.decoration,
      this.fontWeight,
      this.color,
      this.textStyle,
      this.textAlign,
      this.maxlines});
  final String text;
  final double? fontSize;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final Color? color;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxlines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxlines,
      overflow: maxlines == null ? null : TextOverflow.ellipsis,
      style: textStyle ??
          TextStyle(
              fontSize: fontSize, color: color, decoration: decoration, fontWeight: fontWeight),
    );
  }
}
