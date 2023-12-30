import 'package:flutter/material.dart';

class SplashBackGround extends StatelessWidget {
  const SplashBackGround({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xff9AB6AB), Color(0xffFCFDFD)],
            ),
          ),
        ),
        child
      ],
    );
  }
}
