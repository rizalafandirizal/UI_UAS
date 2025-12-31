import 'package:flutter/material.dart';

class DocumentViewerScreen extends StatelessWidget {
  const DocumentViewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 8, 122),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Pengantar User Interface Design',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'Halaman 1/26',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Slide 1
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.asset(
                    'lib/assets/LogoTel-U 1.png',
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Pengantar Desain Antarmuka Pengguna',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Slide 2
            Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Perkenalan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '• UI Design adalah proses merancang antarmuka pengguna untuk aplikasi digital.',
                    style: TextStyle(fontFamily: 'Roboto'),
                  ),
                  Text(
                    '• Tujuan utama adalah membuat aplikasi mudah digunakan dan menarik.',
                    style: TextStyle(fontFamily: 'Roboto'),
                  ),
                  Text(
                    '• Desain UI melibatkan elemen visual seperti warna, tipografi, dan layout.',
                    style: TextStyle(fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
            // Slide 3
            Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Interface',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '• UI adalah bagian dari aplikasi yang berinteraksi langsung dengan pengguna.',
                    style: TextStyle(fontFamily: 'Roboto'),
                  ),
                  Text(
                    '• Elemen UI meliputi tombol, teks, gambar, dan ikon.',
                    style: TextStyle(fontFamily: 'Roboto'),
                  ),
                  Text(
                    '• UI yang baik harus intuitif dan responsif.',
                    style: TextStyle(fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
            // Slide 4
            Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pentingnya Desain UI yang Baik',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '• Desain UI yang baik meningkatkan pengalaman pengguna secara keseluruhan.',
                    style: TextStyle(fontFamily: 'Roboto'),
                  ),
                  Text(
                    '• Mengurangi kesalahan pengguna dan meningkatkan efisiensi.',
                    style: TextStyle(fontFamily: 'Roboto'),
                  ),
                  Text(
                    '• Mendorong retensi pengguna dan meningkatkan konversi.',
                    style: TextStyle(fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}