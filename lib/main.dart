import 'package:ayurvedic_centre/domain/provider/auth_provider.dart';
import 'package:ayurvedic_centre/presentation/patient_list.dart';
import 'package:ayurvedic_centre/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      darkTheme: ThemeData(),

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
