import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'kelas_saya_screen.dart';
import 'notifikasi_screen.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0; // Assuming opened from home, but can be adjusted

  final List<Map<String, dynamic>> courses = [
    {
      'year': '2021/2',
      'name': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
      'code': 'D4SM-42-03',
      'lecturer': 'ADY',
      'progress': 89,
      'image': 'lib/assets/Logo Celoe.png',
    },
    {
      'year': '2021/2',
      'name': 'KEWARGANEGARAAN',
      'code': 'D4SM-42-04',
      'lecturer': 'BUD',
      'progress': 86,
      'image': 'lib/assets/Logo Celoe.png',
    },
    {
      'year': '2021/2',
      'name': 'SISTEM OPERASI',
      'code': 'D4SM-42-05',
      'lecturer': 'CHR',
      'progress': 90,
      'image': 'lib/assets/Logo Celoe.png',
    },
    {
      'year': '2021/2',
      'name': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
      'code': 'D4SM-42-06',
      'lecturer': 'DAN',
      'progress': 90,
      'image': 'lib/assets/Logo Celoe.png',
    },
    {
      'year': '2021/2',
      'name': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
      'code': 'D4SM-42-07',
      'lecturer': 'EVA',
      'progress': 90,
      'image': 'lib/assets/Logo Celoe.png',
    },
    {
      'year': '2021/2',
      'name': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
      'code': 'D4SM-42-08',
      'lecturer': 'FAR',
      'progress': 90,
      'image': 'lib/assets/Logo Celoe.png',
    },
    {
      'year': '2021/2',
      'name': 'OLAHRAGA',
      'code': 'D4SM-42-09',
      'lecturer': 'GEO',
      'progress': 90,
      'image': 'lib/assets/Logo Celoe.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.of(context).pop(); // Back to home
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const KelasSayaScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotifikasiScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Header
          Container(
            height: 220,
            color: const Color.fromARGB(255, 0, 8, 122),
            child: Stack(
              children: [
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          image: const DecorationImage(
                            image: AssetImage('lib/assets/Logo Celoe.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'DANDY CANDRA PRATAMA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Tab Menu
          Positioned(
            top: 180,
            left: 16,
            right: 16,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TabBar(
                controller: _tabController,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3.0, color: Color.fromARGB(255, 0, 8, 122)),
                  insets: EdgeInsets.symmetric(horizontal: 20.0),
                ),
                labelColor: const Color.fromARGB(255, 0, 8, 122),
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: 'About Me'),
                  Tab(text: 'Kelas'),
                  Tab(text: 'Edit Profile'),
                ],
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.only(top: 240),
            child: TabBarView(
              controller: _tabController,
              children: [
                // About Me Tab
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Informasi User',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Email address',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        'dandycandra@365.telkomuniversity.ac.id',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Program Studi',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        'D4 Teknologi Rekayasa Multimedia',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Fakultas',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        'FIT',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Aktivitas Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'First access to site',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        'Monday, 7 September 2020, 9:27 AM (288 days 12 hours)',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Last access to site',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        'Tuesday, 22 June 2021, 9:44 PM (now)',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                              (route) => false,
                            );
                          },
                          icon: const Icon(Icons.logout, color: Colors.white),
                          label: const Text('Log Out'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 0, 8, 122),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Kelas Tab
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Kelas Saya',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: courses.length,
                        itemBuilder: (context, index) {
                          final course = courses[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(course['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        course['name'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${course['code']} - ${course['lecturer']}',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      LinearProgressIndicator(
                                        value: course['progress'] / 100,
                                        backgroundColor: Colors.grey[300],
                                        valueColor: const AlwaysStoppedAnimation<Color>(
                                          Color(0xFFB64545),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${course['progress']}% selesai',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // Edit Profile Tab - Placeholder
                const Center(child: Text('Edit Profile Content')),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 8, 122),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white.withOpacity(0.9),
          unselectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}