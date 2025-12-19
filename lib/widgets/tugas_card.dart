import 'package:flutter/material.dart';

class TugasCard extends StatelessWidget {
  const TugasCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 0, 8, 122),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tugas 01 – UID Android Mobile Game',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(color: Colors.white30),
            const SizedBox(height: 8),
            const Text(
              'Waktu Pengumpulan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const Text(
              'Jumat 26 Februari, 23:59 WIB',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}