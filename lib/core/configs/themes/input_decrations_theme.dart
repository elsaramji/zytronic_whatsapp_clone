import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InputDecorationsTheme {
  static InputDecorationTheme inputdecoration({bool isLight = true}) {
    return InputDecorationTheme(
      filled: true,
      fillColor: isLight ? Colors.grey[200] : Colors.grey[800], // الخلفية
      hintStyle: GoogleFonts.roboto(
          color: isLight ? Colors.grey[600] : Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400),
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r), // Radius 25
        borderSide: BorderSide.none, // بدون خط
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r), // Radius 25
        borderSide: BorderSide.none, // بدون خط
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r), // Radius 25
        borderSide: BorderSide.none, // بدون خط
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide:
            BorderSide(color: Colors.green, width: 1.h), // خط عند التركيز
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide: BorderSide(color: Colors.red, width: 1.h),
      ),
    );
  }
}
