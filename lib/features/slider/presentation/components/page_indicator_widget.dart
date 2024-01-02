import 'package:flutter/material.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({super.key, required this.index, required this.currentIndex});
  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    if (index == currentIndex) {
      return Container(
        width: 40,
        height: 5,
        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
      );
    } else {
      return const Icon(
        Icons.circle,
        color: Colors.grey,
        size: 8,
      );
    }
  }
}
