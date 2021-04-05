import 'package:flutter/material.dart';

class UIConfig {
  static double _screenWidth;
  static double _screenHeight;

  static double _sizeHorizontal;
  static double _sizeVertical;

  static double getHeight(size) {
    return size * _sizeVertical;
  }

  static double getWidth(size) {
    return size * _sizeHorizontal;
  }

  void init(BoxConstraints boxConstraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = boxConstraints.maxWidth;
      _screenHeight = boxConstraints.maxHeight;
    } else {
      _screenWidth = boxConstraints.maxHeight;
      _screenHeight = boxConstraints.maxWidth;
    }

    _sizeHorizontal = _screenWidth / 375;
    _sizeVertical = _screenHeight / 667;
  }
}
