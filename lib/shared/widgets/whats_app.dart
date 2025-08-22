
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/core/configs/themes/theme.dart';
import 'package:whatsapp_clone_flutter/features/home/presentation/pages/home_page.dart';

class WhatsApp extends StatelessWidget {
  const WhatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive UI
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Standard design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'WhatsApp Clone',
          debugShowCheckedModeBanner: false,

          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: ThemeMode.system, // Automatically adapt to system theme
          home: child,
        );
      },
      child: const HomePage(),
    );
  }
}
