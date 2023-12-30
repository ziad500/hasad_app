import 'package:flutter/material.dart';

class DefaultIconButton extends StatelessWidget {
  const DefaultIconButton({super.key, required this.child, required this.onPressed, this.padding});
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: child,
      padding: padding,
    );
  }
}
