import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_tajwid/screens/home_screen.dart';
import 'package:smart_tajwid/screens/splash_screen.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const TajwidApp());
}

class TajwidApp extends StatelessWidget {
  const TajwidApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'Smart Tajwid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
