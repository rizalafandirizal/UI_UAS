import 'package:flutter/material.dart';
import 'lampiran_tab_widget.dart';
import 'material_card.dart';
import 'task_card_widget.dart';

class MateriBottomSheet extends StatefulWidget {
  const MateriBottomSheet({Key? key, required this.item}) : super(key: key);

  final MaterialItem item;

  @override
  _MateriBottomSheetState createState() => _MateriBottomSheetState();
}

class _MateriBottomSheetState extends State<MateriBottomSheet> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    String bottomSheetTitle = widget.item.title.replaceFirst(RegExp(r'^\d+ - '), '');
    String description = widget.item.title.contains('Pengantar') ? 'Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetap pada mata kuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasuki materi mengenai User Experience.' : 'Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna. Lalu dipelajari juga poin-poin penting pada interaction design seperti visibility, feedback, limitation, consistency dan affordance. Dan terakhir materi conceptual dan perceptual design interaction akan memberikan gambaran bagaimana bentuk dari Interaction.';
    List<LampiranItem> lampiran = widget.item.title.contains('Pengantar') ? [
      LampiranItem(
        title: 'Zoom Meeting Synchronous',
        icon: Icons.video_call,
        isCompleted: true,
      ),
      LampiranItem(
        title: 'Pengantar User Interface Design',
        icon: Icons.description,
        isCompleted: false,
      ),
      LampiranItem(
        title: 'Empat Teori Dasar Antarmuka Pengguna',
        icon: Icons.picture_as_pdf,
        isCompleted: false,
      ),
      LampiranItem(
        title: 'Empat Teori Dasar Antarmuka Pengguna',
        icon: Icons.description,
        isCompleted: true,
      ),
      LampiranItem(
        title: 'User Interface Design for Beginner',
        icon: Icons.picture_as_pdf,
        isCompleted: true,
      ),
      LampiranItem(
        title: '20 Prinsip Desain',
        icon: Icons.description,
        isCompleted: true,
      ),
      LampiranItem(
        title: 'Best Practice UI Design',
        icon: Icons.picture_as_pdf,
        isCompleted: true,
      ),
    ] : [
      LampiranItem(
        title: 'Zoom Meeting Synchronous',
        icon: Icons.video_call,
        isCompleted: true,
      ),
      LampiranItem(
        title: 'Elemen-elemen Antarmuka Pengguna',
        icon: Icons.description,
        isCompleted: true,
      ),
      LampiranItem(
        title: 'UID Guidelines and Principles',
        icon: Icons.picture_as_pdf,
        isCompleted: true,
      ),
      LampiranItem(
        title: 'User Profile',
        icon: Icons.description,
        isCompleted: true,
      ),
      LampiranItem(
        title: 'Principles of User Interface Design URL',
        icon: Icons.link,
        isCompleted: true,
      ),
    ];

    List<TaskItem> tasks = widget.item.title.contains('Pengantar') ? [
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
    ] : [];

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              // Drag handle
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              // Title
              Text(
                bottomSheetTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Description section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Deskripsi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 16),
              // Custom Tab menu
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 0),
                      child: Column(
                        children: [
                          Text(
                            'Lampiran Materi',
                            style: TextStyle(
                              fontSize: 14,
                              color: _selectedTab == 0 ? Colors.black : Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 2,
                            color: _selectedTab == 0 ? Colors.black : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 1),
                      child: Column(
                        children: [
                          Text(
                            'Tugas dan Kuis',
                            style: TextStyle(
                              fontSize: 14,
                              color: _selectedTab == 1 ? Colors.black : Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 2,
                            color: _selectedTab == 1 ? Colors.black : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Tab content
              _selectedTab == 0 ? LampiranTabWidget(lampiran: lampiran) : tasks.isEmpty ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/Learning Management System.png',
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Tidak Ada Tugas Dan Kuis Hari Ini',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ) : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskCard(item: tasks[index]);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}