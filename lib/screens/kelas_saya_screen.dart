import 'package:flutter/material.dart';
import '../widgets/kelas_card.dart';
import 'notifikasi_screen.dart';

class KelasSayaScreen extends StatefulWidget {
  const KelasSayaScreen({super.key});

  @override
  State<KelasSayaScreen> createState() => _KelasSayaScreenState();
}

class _KelasSayaScreenState extends State<KelasSayaScreen> {
  int _selectedIndex = 1; // Kelas Saya active

  final List<Map<String, dynamic>> courses = [
    {
      'year': '2021/2',
      'name': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
      'code': 'D4SM-42-03',
      'lecturer': 'ADY',
      'progress': 89,
      'image': 'lib/assets/materi1.jpg',
    },
    {
      'year': '2021/2',
      'name': 'KEWARGANEGARAAN',
      'code': 'D4SM-42-04',
      'lecturer': 'BUD',
      'progress': 86,
      'image': 'lib/assets/materi2.jpg',
    },
    {
      'year': '2021/2',
      'name': 'SISTEM OPERASI',
      'code': 'D4SM-42-05',
      'lecturer': 'CHR',
      'progress': 90,
      'image': 'lib/assets/materi3.jpg',
    },
    {
      'year': '2021/2',
      'name': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
      'code': 'D4SM-42-06',
      'lecturer': 'DAN',
      'progress': 90,
      'image': 'lib/assets/materi4.jpg',
    },
    {
      'year': '2021/2',
      'name': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
      'code': 'D4SM-42-07',
      'lecturer': 'EVA',
      'progress': 90,
      'image': 'lib/assets/materi5.jpg',
    },
    {
      'year': '2021/2',
      'name': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
      'code': 'D4SM-42-08',
      'lecturer': 'FAR',
      'progress': 90,
      'image': 'lib/assets/materi6.jpg',
    },
    {
      'year': '2021/2',
      'name': 'OLAHRAGA',
      'code': 'D4SM-42-09',
      'lecturer': 'GEO',
      'progress': 90,
      'image': 'lib/assets/materi7.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Kelas Saya',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return KelasCard(
                year: course['year'],
                name: course['name'],
                code: course['code'],
                lecturer: course['lecturer'],
                progress: course['progress'],
                image: course['image'],
                isFirst: index == 0,
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SizedBox(
          height: 65,
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFFB64545),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.7),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            currentIndex: _selectedIndex,
            onTap: (index) {
              if (index == 0) {
                Navigator.of(context).popUntil((route) => route.isFirst);
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotifikasiScreen()),
                );
              } else {
                setState(() {
                  _selectedIndex = index;
                });
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Kelas Saya',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifikasi',
              ),
            ],
          ),
        ),
      ),
    );
  }
}