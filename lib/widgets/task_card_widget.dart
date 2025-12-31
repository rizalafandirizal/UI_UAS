import 'package:flutter/material.dart';
import '../screens/quiz_instructions_screen.dart';
import '../screens/detail_tugas_screen.dart';
import '../data/quiz_data.dart';

class TaskItem {
  final String badge;
  final String title;
  final String deadline;
  final bool isCompleted;
  final IconData icon;

  TaskItem({
    required this.badge,
    required this.title,
    required this.deadline,
    required this.isCompleted,
    required this.icon,
  });
}

class TaskCard extends StatelessWidget {
  final TaskItem item;

  const TaskCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          if (item.badge == 'QUIZ' && item.title == 'Quiz Review 01') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizInstructionsScreen(quiz: quizData),
              ),
            );
          } else if (item.badge == 'Tugas' && item.title == 'Tugas 01 – UID Android Mobile Game') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailTugasScreen(),
              ),
            );
          } else {
            // Dummy navigation to detail page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: Text(item.title),
                    backgroundColor: Color.fromARGB(255, 0, 8, 122),
                  ),
                  body: const Center(
                    child: Text('Detail Tugas/Kuis Page (Dummy)'),
                  ),
                ),
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    item.icon,
                    size: 40,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.deadline,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    item.badge,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  Icons.check_circle,
                  color: item.isCompleted ? Colors.green : Colors.grey,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}