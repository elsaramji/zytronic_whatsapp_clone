import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_clone_flutter/core/configs/themes/dark_theme.dart';
import 'package:whatsapp_clone_flutter/core/configs/themes/light_theme.dart';

class AppTheme {
  // Common text theme for both light and dark modes
  static final TextTheme _textTheme = TextTheme(
    bodyLarge: GoogleFonts.roboto(fontSize: 16.0.sp),
    bodyMedium: GoogleFonts.roboto(fontSize: 14.0.sp),
    titleLarge:
        GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 20.0.sp),
    titleMedium:
        GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 16.0.sp),
    titleSmall:
        GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 14.0.sp),
    bodySmall: GoogleFonts.roboto(fontSize: 12.0.sp),
    labelLarge:
        GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16.0.sp),
    labelMedium:
        GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 14.0.sp),
    labelSmall:
        GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 12.0.sp),
  );
  // Light theme
  static ThemeData lightTheme() => LightTheme.lightTheme(_textTheme);
// Dark theme
  static ThemeData darkTheme() => DarkTheme.darkTheme(_textTheme);
}
