// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => Directionality(
        textDirection:
            TextDirection.rtl,
        child: child!,
      ),
      locale: const Locale("ar"),
      title: 'Flutter Shop',
      debugShowCheckedModeBanner: false,


      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFF0A0E1A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E1A),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),


      home: const LoginScreen(),
    );
  }
}
