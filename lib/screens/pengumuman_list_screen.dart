import 'package:flutter/material.dart';
import 'detail_pengumuman_screen.dart';
import 'kelas_saya_screen.dart';

class PengumumanListScreen extends StatefulWidget {
  const PengumumanListScreen({super.key});

  @override
  State<PengumumanListScreen> createState() => _PengumumanListScreenState();
}

class _PengumumanListScreenState extends State<PengumumanListScreen> {
  int _selectedIndex = 0; // Follows previous page, assuming Home active

  final List<Map<String, String>> announcements = [
    {
      'title': 'Maintenance Pra UAS Semester Genap 2020/2021',
      'date': 'By Admin CeLOE - Rabu, 2 Juni 2021, 10:45',
      'image': 'lib/assets/pengumuman.jpg',
    },
    {
      'title': 'Pengumuman Maintenance',
      'date': 'By Admin CeLOE - Senin, 11 Januari 2021, 7:52',
      'image': 'lib/assets/pengumuman.jpg',
    },
    {
      'title': 'Maintenance Pra UAS Semester Ganjil 2020/2021',
      'date': 'By Admin CeLOE - Minggu, 10 Januari 2021, 9:30',
      'image': 'lib/assets/pengumuman.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 8, 122),
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Pengumuman',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final announcement = announcements[index];
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.campaign, color: Colors.black),
                title: Text(
                  announcement['title']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  announcement['date']!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPengumumanScreen(
                        title: announcement['title']!,
                        date: announcement['date']!,
                        content: '',
                        image: announcement['image']!,
                      ),
                    ),
                  );
                },
              ),
              if (index < announcements.length - 1) const Divider(height: 16),
            ],
          );
        },
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SizedBox(
          height: 65,
          child: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 0, 8, 122),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.7),
            currentIndex: _selectedIndex,
            onTap: (index) {
              if (index == 0) {
                Navigator.of(context).popUntil((route) => route.isFirst);
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KelasSayaScreen()),
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