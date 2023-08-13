import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  void push(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }

  void pop() => Navigator.of(this).pop();

  void pushReplacement(Widget page) {
    Navigator.of(this)
        .pushReplacement(MaterialPageRoute(builder: (context) => page));
  }
}

extension ResponsiveIntegerConstraints on num {
  double toResponsiveHeight(BuildContext context) {
    return this * context.screenHeight / 844;
  }

  double toResponsiveWidth(BuildContext context) {
    return this * context.screenWidth / 390;
  }
}
