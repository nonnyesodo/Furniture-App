import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFBFFF95);
  static const Color white = Colors.white;
  static const Color green = Color(0xFF1f5a06);
  static const Color lightGreen = Color(0xFF1f5a06);
  static const Color black = Color(0xFF0A0D14);
  static const Color yellow = Color(0xFFFDC413);
  static const Color redText = Color(0xFFE71E25);
  static const Color textGray0 = Color(0xFFCDD0D5);
  static const Color textGray1 = Color(0xFF605A5A);
  static Color blackOrWhite(BuildContext context,
          {bool reverse = false}) =>
      reverse
          ? (Theme.of(context).brightness == Brightness.light
              ? AppColors.white
              : AppColors.black)
          : (Theme.of(context).brightness == Brightness.light
              ? AppColors.black
              : AppColors.white);

  static Color greyOrWhite(context) =>
      Theme.of(context).brightness == Brightness.light
          ? textGray1.withValues(alpha: 0.5)
          : Colors.white;
}
