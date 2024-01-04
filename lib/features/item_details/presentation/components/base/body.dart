import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemDetailsBody extends StatelessWidget {
  const ItemDetailsBody({super.key, required this.body, this.actions});
  final Widget body;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Stack(
        children: [
          Scaffold(body: body),
          Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                actions: actions,
                leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              )),
        ],
      ),
    );
  }
}
