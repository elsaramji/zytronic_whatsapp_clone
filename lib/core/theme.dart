import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Common text theme for both light and dark modes
  static final TextTheme _textTheme = TextTheme(
    bodyLarge: GoogleFonts.roboto(fontSize: 16.0.sp),
    bodyMedium: GoogleFonts.roboto(fontSize: 14.0.sp),
    titleLarge: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 20.0.sp),
    titleMedium:
        GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 16.0.sp),
    titleSmall:
        GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 14.0.sp),
    bodySmall: GoogleFonts.roboto(fontSize: 12.0.sp),
    labelLarge: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16.0.sp),
    labelMedium:
        GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 14.0.sp),
    labelSmall:
        GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 12.0.sp),
  );

  // Light Theme Colors & Configuration
  static final ThemeData lightTheme = ThemeData(
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
      backgroundColor: const Color(0xFF075E54),
      elevation: 4,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white.withAlpha(70),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: Colors.white, width: 2.0),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF25D366),
      foregroundColor: Colors.white,
    ),
    textTheme: _textTheme,
  );

  // Dark Theme Colors & Configuration
  static final ThemeData darkTheme = ThemeData(
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
      backgroundColor: const Color(0xFF1F2C34),
      elevation: 4,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 20.0,
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
    textTheme: _textTheme,
  );
}
