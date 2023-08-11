

import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }
  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get screenWidth => MediaQuery.sizeOf(this).width;
}

extension ResponsiveIntegerConstraints on num {
  double toResponsiveHeight(BuildContext context) {
    return this * context.screenHeight / 844;
  }

  double toResponsiveWidth(BuildContext context) {
    return this * context.screenWidth / 390;
  }
}