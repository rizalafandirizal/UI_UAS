import 'package:flutter/material.dart';
import '../widgets/material_card.dart';
import '../widgets/task_card_widget.dart';

class DetailKelasScreen extends StatelessWidget {
  const DetailKelasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MaterialItem> materials = [
      MaterialItem(
        pertemuan: 'Pertemuan 1',
        title: '01 - Pengantar User Interface Design',
        description: '3 URLs, 2 Files, 3 Interactive Content',
        isCompleted: false,
      ),
      MaterialItem(
        pertemuan: 'Pertemuan 2',
        title: '02 - Konsep User Interface Design',
        description: '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
        isCompleted: true,
      ),
      MaterialItem(
        pertemuan: 'Pertemuan 3',
        title: '03 - Interaksi pada User Interface Design',
        description: '3 URLs, 2 Files, 3 Interactive Content',
        isCompleted: true,
      ),
      MaterialItem(
        pertemuan: 'Pertemuan 4',
        title: '04 - Ethnographic Observation',
        description: '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
        isCompleted: true,
      ),
      MaterialItem(
        pertemuan: 'Pertemuan 5',
        title: '05 - UID Testing',
        description: '3 URLs, 2 Files, 3 Interactive Content',
        isCompleted: true,
      ),
      MaterialItem(
        pertemuan: 'Pertemuan 6',
        title: '06 - Assessment 1',
        description: '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
        isCompleted: true,
      ),
    ];

    final List<TaskItem> tasks = [
      TaskItem(
        badge: 'QUIZ',
        title: 'Quiz Review 01',
        deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
        isCompleted: true,
        icon: Icons.quiz,
      ),
      TaskItem(
        badge: 'Tugas',
        title: 'Tugas 01 – UID Android Mobile Game',
        deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
        isCompleted: false,
        icon: Icons.description,
      ),
      TaskItem(
        badge: 'Pertemuan 3',
        title: 'Kuis – Assessment 2',
        deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
        isCompleted: true,
        icon: Icons.quiz,
      ),
    ];

    return DefaultTabController(
      length: 2,
      initialIndex: 1, // Tugas Dan Kuis active
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            backgroundColor: const Color(0xFFB64545),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Column(
              children: [
                Text(
                  'DESAIN ANTARMUKA & PENGALAMAN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'PENGGUNA D4SM-42-03 [ADY]',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            centerTitle: true,
            elevation: 0,
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: 'Materi'),
                  Tab(text: 'Tugas Dan Kuis'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFF2F2F2),
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: materials.length,
                      itemBuilder: (context, index) {
                        return MaterialCard(item: materials[index]);
                      },
                    ),
                    ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskCard(item: tasks[index]);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFFB64545),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            currentIndex: 1, // Kelas Saya is active
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
            onTap: (index) {
              // Dummy navigation
              if (index == 0) {
                // Navigate to Home
              } else if (index == 2) {
                // Navigate to Notifikasi
              }
            },
          ),
        ),
      ),
    );
  }
}