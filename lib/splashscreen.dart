import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
// import halaman login kamu
import 'login.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/pngwing_com.png',
                    width: 150,
                  ).animate().scale(duration: 1000.ms, curve: Curves.easeOutBack),
                  const SizedBox(height: 20),
                  Text(
                    'WELCOME',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black45,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(duration: 2000.ms),
                  const SizedBox(height: 10),
                  CircularProgressIndicator(
                    color: Colors.white,
                  ).animate().fadeIn(duration: 2500.ms),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              '© 2025 SagiScorp. All Rights Reserved.',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ).animate().fadeIn(duration: 3000.ms),
          ),
        ],
      ),
    );
  }
}
