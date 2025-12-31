import 'package:flutter/material.dart';
import '../models/quiz_models.dart';

class QuizNavigationScreen extends StatelessWidget {
  final Quiz quiz;
  final QuizState quizState;

  const QuizNavigationScreen({
    Key? key,
    required this.quiz,
    required this.quizState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 8, 122),
          title: Text('Quiz Review 1', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Text(
                  '${quizState.timeRemaining.inMinutes.toString().padLeft(2, '0')}:${(quizState.timeRemaining.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(15, (index) {
              final questionId = quiz.questions[index].id;
              final isAnswered = quizState.selectedAnswers.containsKey(questionId);
              return GestureDetector(
                onTap: () => Navigator.of(context).pop(index),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isAnswered ? Colors.green : Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: isAnswered ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}