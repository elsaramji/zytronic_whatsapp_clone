import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_clone_flutter/core/configs/themes/input_decrations_theme.dart';

class DarkTheme {
  // Dark Theme Colors & Configuration
  static  ThemeData darkTheme(TextTheme textTheme) => ThemeData(
    textTheme: textTheme,
    inputDecorationTheme: InputDecorationsTheme.inputdecoration(isLight: false),
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1F2C34),
    scaffoldBackgroundColor: const Color(0xFF121B22),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Color(0xFF1F2C34),
      secondary: Color(0xFF00A884), // Accent color

      surface: Color(0xFF1F2C34),
      onPrimary: Colors.white,
      onSecondary: Colors.white,

      onSurface: Colors.white,
      error: Colors.red,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF121B22),
      elevation: 4,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 20.0.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: const Color(0xFF00A884),
      unselectedLabelColor: Colors.grey[400],
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xFF00A884), width: 2.0),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF00A884),
      foregroundColor: Colors.white,
    ),
  );
}
