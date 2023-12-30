import 'package:hasad_app/generated/app_strings.g.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/* showCustomToast({
  required context,
  required String? text,
  void Function()? onVisible,
  Color? textcolor,
  IconData? icon,
  Color? iconColor,
  required ToastStates state,
}) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    width: double.maxFinite,
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0).w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0).w,
      color: chooseToastColor(state),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text!.contains("null") ? LocaleKeys.internalServerError.tr() : text,
            style: const TextStyle(color: Colors.white, fontSize: 14.0, height: 1.5),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
            onTap: () {
              fToast.removeCustomToast();
            },
            child: const Icon(Icons.cancel)),
      ],
    ),
  );
  fToast.showToast(
    child: toast,
    gravity: ToastGravity.TOP,
  );
  fToast.showToast(
      child: toast,
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: 0.0,
          child: child,
        );
      });
}
 */
void showSnackbar(
        {required context,
        required String? text,
        void Function()? onVisible,
        Color? textcolor,
        IconData? icon,
        Color? iconColor,
        required ToastStates state,
        ToastGravity? gravity}) =>
    Fluttertoast.showToast(
        msg: text!.contains("null") ? LocaleKeys.internal_server_error.tr() : text,
        toastLength: Toast.LENGTH_LONG,
        gravity: gravity ?? ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state),
        textColor: textcolor ?? Colors.white,
        fontSize: 16.0);

// ignore: constant_identifier_names
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = const Color(0xff4CC985);
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.red;
      break;
  }
  return color;
}
