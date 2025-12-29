import 'package:flutter/material.dart';
import '../models/quiz_models.dart';
import 'quiz_results_screen.dart';

class QuizReviewScreen extends StatelessWidget {
  final Quiz quiz;
  final QuizState quizState;
  final DateTime startTime;

  const QuizReviewScreen({
    Key? key,
    required this.quiz,
    required this.quizState,
    required this.startTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final finishedAt = DateTime.now();
    final completionTime = finishedAt.difference(startTime);
    final correctAnswers = quiz.questions.where((q) => quizState.selectedAnswers[q.id] == q.correctAnswerIndex).length;
    final score = (correctAnswers / quiz.questions.length * 100).round();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFB84A4A),
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
                  '00:00',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Review Jawaban',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Started At: ${startTime.toString()}'),
                      Text('Status: Completed'),
                      Text('Finished At: ${finishedAt.toString()}'),
                      Text('Completion Time: ${completionTime.inMinutes}:${(completionTime.inSeconds % 60).toString().padLeft(2, '0')}'),
                      Text('Score: $score%'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: quiz.questions.length,
                  itemBuilder: (context, index) {
                    final question = quiz.questions[index];
                    final selectedAnswerIndex = quizState.selectedAnswers[question.id];
                    final selectedAnswerText = selectedAnswerIndex != null ? question.options[selectedAnswerIndex] : 'Not answered';
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pertanyaan ${index + 1}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Container(
                          color: Colors.grey[200],
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(question.text),
                              SizedBox(height: 10),
                              Text('Selected Answer: $selectedAnswerText'),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  // Navigate to read-only question view
                                  // Placeholder: assume QuizQuestionReadOnlyScreen exists
                                },
                                child: Text(
                                  'Lihat Soal',
                                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final attempt = QuizAttempt(
                    startTime: startTime,
                    endTime: finishedAt,
                    answers: quizState.selectedAnswers,
                    score: score.toDouble(),
                    isCompleted: true,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizResultsScreen(attempt: attempt),
                    ),
                  );
                },
                child: Text('Kirim Jawaban'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}