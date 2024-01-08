import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/default_text.dart';

class TextWithShadowWidget extends StatelessWidget {
  const TextWithShadowWidget(
      {super.key, required this.text, required this.textStyle, this.maxlines});
  final String text;
  final TextStyle? textStyle;
  final int? maxlines;

  @override
  Widget build(BuildContext context) {
    return DefaultText(
      text: text,
      maxlines: maxlines,
      textStyle: textStyle?.copyWith(
        shadows: <Shadow>[
          Shadow(
            offset: const Offset(3.0, 3.0),
            blurRadius: 1.0,
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
