import 'package:flutter/material.dart';

class LoginBackGround extends StatelessWidget {
  const LoginBackGround({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          color: const Color(0xffEAE9E9),
          width: double.infinity,
          /*   decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xff9AB6AB), Color(0xffFCFDFD)],
            ),
          ), */
        ),
        child
      ],
    );
  }
}
