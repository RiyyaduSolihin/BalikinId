import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart'; // Pastikan import ini sesuai dengan nama file HomeScreen Anda

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Mengatur timer selama 3 detik sebelum pindah ke HomeScreen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Warna background putih menyesuaikan logo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan gambar logo dari folder assets
            Image.asset(
              'assets/logo.png', // Pastikan nama dan path sesuai
              width: 250, // Sesuaikan ukuran logo jika perlu
            ),
            const SizedBox(height: 24),
            // Opsional: Indikator loading kecil di bawah logo
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF0B7B69)),
            ),
          ],
        ),
      ),
    );
  }
}