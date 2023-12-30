import 'package:flutter/material.dart';

import 'default_text.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.fontSize,
      this.decoration,
      this.fontWeight,
      this.color,
      this.textStyle,
      this.icon});
  final void Function() onPressed;
  final String text;
  final double? fontSize;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final Color? color;
  final TextStyle? textStyle;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: const ButtonStyle(visualDensity: VisualDensity.compact),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultText(
                text: text,
                fontSize: fontSize,
                textStyle: textStyle ??
                    Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: color,
                        ),
                decoration: decoration,
                fontWeight: fontWeight),
            if (icon != null) ...[
              const SizedBox(
                width: 8,
              ),
              icon!
            ]
          ],
        ));
  }
}
