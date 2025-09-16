import 'dart:async';

import 'package:ayurvedic_centre/presentation/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/bg/splashscreen.jpg",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
