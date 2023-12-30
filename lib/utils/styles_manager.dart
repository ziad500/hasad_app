import 'package:flutter/cupertino.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: FontConstatnts.fontFamily);
}

//Regular Style
TextStyle getRegularStyle({double? fontSize, required Color color}) {
  return _getTextStyle(fontSize ?? FontSize.s10, FontWeightManager.regular, color);
}

//Medium Style
TextStyle getMediumStyle({double? fontSize, required Color color}) {
  return _getTextStyle(fontSize ?? FontSize.s10, FontWeightManager.medium, color);
}

//Light Style
TextStyle getLightStyle({double? fontSize, required Color color}) {
  return _getTextStyle(fontSize ?? FontSize.s10, FontWeightManager.light, color);
}

//Bold Style
TextStyle getBoldStyle({double? fontSize, required Color color}) {
  return _getTextStyle(fontSize ?? FontSize.s10, FontWeightManager.bold, color);
}

//SemiBold Style
TextStyle getSemiBoldStyle({double? fontSize, required Color color}) {
  return _getTextStyle(fontSize ?? FontSize.s10, FontWeightManager.semiBold, color);
}
