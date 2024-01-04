import 'package:flutter/material.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget(
      {super.key, required this.index, required this.currentIndex, this.color});
  final int index;
  final int currentIndex;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (index == currentIndex) {
      return Container(
        width: 40,
        height: 5,
        decoration:
            BoxDecoration(color: color ?? Colors.black, borderRadius: BorderRadius.circular(20)),
      );
    } else {
      return Icon(
        Icons.circle,
        color: color != null ? color?.withOpacity(0.2) : Colors.grey,
        size: 8,
      );
    }
  }
}
