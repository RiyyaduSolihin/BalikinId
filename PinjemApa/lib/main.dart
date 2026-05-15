import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import file splash screen yang baru dibuat

void main() {
  runApp(const PinjemApaApp());
}

class PinjemApaApp extends StatelessWidget {
  const PinjemApaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinjem Apa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0B7B69),
        scaffoldBackgroundColor: const Color(0xFFF7F9F8),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      // Ubah dari HomeScreen() menjadi SplashScreen()
      home: const SplashScreen(),
    );
  }
}