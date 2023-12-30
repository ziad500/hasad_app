/* import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DragableButtonState { initial, dragging, reset }

class DragableButtonController extends GetxController {
  DragableButtonController() : super();

  DragableButtonState dragableButtonState = DragableButtonState.initial;

  double translateX = 0.0;
  double translateY = 0.0;
  double myWidth = 0.0;

  void updateTranslateX(double value) {
    translateX = value;
    dragableButtonState = DragableButtonState.dragging;
    update();
  }

  void resetValues() {
    translateX = 0.0;
    myWidth = 0.0;
    dragableButtonState = DragableButtonState.reset;
    update();
  }

  void incTansXVal(context) async {
    int canLoop = -1;
    for (var i = 0; canLoop == -1; i++) {
      await Future.delayed(const Duration(milliseconds: 1), () {
        if (translateX + 1 < MediaQuery.of(context).size.width - (200 + myWidth)) {
          translateX += 1;
          myWidth = MediaQuery.of(context).size.width - (200 + myWidth);
        } else {
          canLoop = 1;
        }
        dragableButtonState = DragableButtonState.dragging;
        update();
        Future.delayed(const Duration(seconds: 1)).then((value) {
          canLoop = 1;
          resetValues();
        });
      });
    }
  }
}
 */