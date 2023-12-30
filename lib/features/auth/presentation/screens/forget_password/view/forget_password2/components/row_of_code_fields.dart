import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'code_textfield.dart';

class RowOfCodesFields extends StatelessWidget {
  const RowOfCodesFields(
      {super.key,
      required this.code1Controller,
      required this.code2Controller,
      required this.code3Controller,
      required this.code4Controller});
  final TextEditingController code1Controller;
  final TextEditingController code2Controller;
  final TextEditingController code3Controller;
  final TextEditingController code4Controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Row(
        children: [
          Expanded(
              child: CodeTextField(
            controller: code1Controller,
          )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: CodeTextField(
            controller: code2Controller,
          )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: CodeTextField(
            controller: code3Controller,
          )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: CodeTextField(
            controller: code4Controller,
          )),
        ],
      ),
    );
  }
}
