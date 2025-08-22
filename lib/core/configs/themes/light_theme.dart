import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_clone_flutter/core/configs/themes/input_decrations_theme.dart';

class LightTheme {
   // Light Theme Colors & Configuration
  static ThemeData lightTheme(TextTheme textTheme) => ThemeData(
    textTheme: textTheme,
    inputDecorationTheme:InputDecorationsTheme.inputdecoration(isLight: true),
    brightness: Brightness.light,
    primaryColor: const Color(0xFF075E54),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF075E54),
      secondary: Color(0xFF25D366),
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      error: Colors.red,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 20.0.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}