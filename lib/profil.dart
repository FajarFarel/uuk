import 'dart:io';
import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  final String userName;
  final File userImage;

  const ProfilPage({
    super.key,
    required this.userName,
    required this.userImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Vertikal tengah
              crossAxisAlignment: CrossAxisAlignment.center, // Horizontal tengah
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: FileImage(userImage),
                ),
                const SizedBox(height: 20),
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
