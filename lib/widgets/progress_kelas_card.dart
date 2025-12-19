import 'package:flutter/material.dart';

class ProgressKelasCard extends StatelessWidget {
  const ProgressKelasCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> courses = [
      {
        'name': 'Desain Antarmuka & Pengalaman Pengguna',
        'code': 'IF1234',
        'lecturer': 'Dr. John Doe',
        'progress': 89,
        'image': 'lib/assets/kampus.jpg',
      },
      {
        'name': 'Kewarganegaraan',
        'code': 'IF5678',
        'lecturer': 'Prof. Jane Smith',
        'progress': 75,
        'image': 'lib/assets/kampus.jpg',
      },
      {
        'name': 'Sistem Operasi',
        'code': 'IF9012',
        'lecturer': 'Dr. Alan Turing',
        'progress': 92,
        'image': 'lib/assets/kampus.jpg',
      },
      {
        'name': 'Pemrograman Multimedia Interaktif',
        'code': 'IF3456',
        'lecturer': 'Ms. Ada Lovelace',
        'progress': 68,
        'image': 'lib/assets/kampus.jpg',
      },
      {
        'name': 'Bahasa Inggris',
        'code': 'IF7890',
        'lecturer': 'Mr. Shakespeare',
        'progress': 85,
        'image': 'lib/assets/kampus.jpg',
      },
      {
        'name': 'Olahraga',
        'code': 'IF1111',
        'lecturer': 'Coach Mike',
        'progress': 95,
        'image': 'lib/assets/kampus.jpg',
      },
    ];

    return Column(
      children: courses.map((course) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset(
                  course['image'],
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '2021/2',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        course['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${course['code']} - ${course['lecturer']}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: course['progress'] / 100,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 0, 8, 122)),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${course['progress']} % Selesai',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}