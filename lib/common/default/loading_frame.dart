import 'package:flutter/material.dart';

class LoadingFrame extends StatelessWidget {
  const LoadingFrame({super.key, required this.child, required this.loadingStates});
  final Widget child;
  final List<Widget> loadingStates;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [child, ...loadingStates],
    );
  }
}
