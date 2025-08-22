import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/shared/services/firebase_options.dart';
import 'package:whatsapp_clone_flutter/shared/widgets/whats_app.dart';

void main() async {
  // widget initialization
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase initialization
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  // Configuring Screen Size
  await ScreenUtil.ensureScreenSize();
  // App Lunch Point
  runApp(const WhatsApp());
}
