import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class CustomTextStyle {
  static TextStyle spartanTextStyle(TextStyle textStyle) {
    return GoogleFonts.leagueSpartan(
      textStyle: textStyle,
    );
  }
}
