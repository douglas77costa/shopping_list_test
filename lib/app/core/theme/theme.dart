import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData appTheme(BuildContext context) => ThemeData(
    brightness: Brightness.light,
    textTheme: GoogleFonts.interTextTheme(
      Theme.of(context)
          .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    ),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: AppColors.createMaterialColor(AppColors.primary))
        .copyWith(
            secondary: AppColors.createMaterialColor(AppColors.secondary)));
