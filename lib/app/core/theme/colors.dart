import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF4285F4);
  static const Color primaryDark = Color(0xFF004AAD);
  static const Color primaryLight = Color(0xFF7BA3FF);

  static const Color secondary = Color(0xFF007A27);

  static const Color redError = Color(0xFFff3e34);
  static const Color redErrorDark = Color(0xFFc4000a);
  static const Color redErrorMedium = Color(0xFFFF574D);
  static const Color redErrorLight = Color(0xFFff765f);

  static const Color greenSuccess = Color(0xFF18AB53);
  static const Color greenSuccessMedium = Color(0xFF4CD964);
  static const Color greenSuccessLight = Color(0xFFB7FFAA);

  static const Color orangeWarning = Color(0xFFED8E00);
  static const Color orangeWarningMedium = Color(0xFFFFBD3E);
  static const Color orangeWarningLight = Color(0xFFFFE3B9);

  static const Color blueInfo = Color(0xFF007AFE);
  static const Color blueInfoMedium = Color(0xFF4DAAFF);
  static const Color blueBlueInfoLight = Color(0xFFC6DFFF);

  static const Color defaultTextColor = Color(0xFF5F6368);

  static const Color neutral0 = Color(0xFFF4F3F3);
  static const Color neutral1 = Color(0xFFE9E9E9);
  static const Color neutral2 = Color(0xFFDBDBDB);
  static const Color neutral3 = Color(0xFF929292);

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
