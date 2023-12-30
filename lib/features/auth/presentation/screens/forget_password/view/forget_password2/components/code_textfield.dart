import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../../../utils/app_colors.dart';

class CodeTextField extends StatefulWidget {
  const CodeTextField({
    Key? key,
    required this.controller,
    this.validator,
    this.unFocus = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool unFocus;

  @override
  State<CodeTextField> createState() => _CodeTextFieldState();
}

class _CodeTextFieldState extends State<CodeTextField> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    isEnabled = widget.controller.text != "" ? true : false;
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: isEnabled
              ? null
              : const [
                  BoxShadow(
                    color: Colors.grey, // Shadow color
                    offset: Offset(0, 3), // Offset of the shadow
                    blurRadius: 6, // Spread of the shadow
                    spreadRadius: 0, // Expands the shadow
                  ),
                ],
          border: Border.all(
              width: 1.0,
              color: isEnabled ? AppColors.primaryColor : AppColors.white), // Optional border
        ),
        width: 100,
        //  height: 48,
        child: TextFormField(
          style: const TextStyle(color: AppColors.black), // Set the text color to blue

          validator: widget.validator,
          maxLength: 1,
          keyboardType: TextInputType.number,
          controller: widget.controller,
          onChanged: (value) {
            if (widget.unFocus) {
              FocusScope.of(context).unfocus();
            } else {
              FocusScope.of(context).nextFocus();
            }

            if (value != "") {
              setState(() {
                isEnabled = true;
              });
            } else {
              setState(() {
                isEnabled = false;
              });
            }
          },
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.transparent)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.transparent)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.transparent))),
        ));
  }
}
