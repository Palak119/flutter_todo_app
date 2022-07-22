import 'package:flutter/material.dart';

class SizeUtil {
  static late MediaQueryData _mediaQuery;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    screenWidth = _mediaQuery.size.width;
    screenHeight = _mediaQuery.size.height;
    orientation = _mediaQuery.orientation;
  }
}

double sizeHeight(double inputHeight) {
  double screenHeight = SizeUtil.screenHeight;

  return (inputHeight / 812.0) * screenHeight;
}

double sizeWidth(double inputWidth) {
  double screenWidth = SizeUtil.screenWidth;

  return (inputWidth / 375.0) * screenWidth;
}
