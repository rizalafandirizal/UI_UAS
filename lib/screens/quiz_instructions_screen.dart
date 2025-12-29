import 'package:flutter/material.dart';
import '../models/quiz_models.dart';
import 'quiz_question_screen.dart';

class QuizInstructionsScreen extends StatefulWidget {
  final Quiz quiz;

  const QuizInstructionsScreen({Key? key, required this.quiz}) : super(key: key);

  @override
  _QuizInstructionsScreenState createState() => _QuizInstructionsScreenState();
}

class _QuizInstructionsScreenState extends State<QuizInstructionsScreen> {
  late Duration _timeRemaining;

  @override
  void initState() {
    super.initState();
    _timeRemaining = Duration(minutes: widget.quiz.timeLimitMinutes);
  }

  @override
  Widget build(BuildContext context) {
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
            IconButton(
              icon: Icon(Icons.timer, color: Colors.white),
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Text(
                  '${_timeRemaining.inMinutes.toString().padLeft(2, '0')}:${(_timeRemaining.inSeconds % 60).toString().padLeft(2, '0')}',
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
                'Instructions for the quiz. Please read carefully before starting.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Quiz closes: December 31, 2025, 23:59'),
                      SizedBox(height: 8),
                      Text('Time limit: ${widget.quiz.timeLimitMinutes} minutes'),
                      SizedBox(height: 8),
                      Text('Scoring method: Highest Score'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                color: Colors.pink[100],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Attempt history'),
                      SizedBox(height: 10),
                      Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Status'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Score / 100.00'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Review link'),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Completed'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('85.0'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Review'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizQuestionScreen(
                              quiz: widget.quiz,
                              initialState: QuizState(
                                currentQuestionIndex: 0,
                                selectedAnswers: {},
                                timeRemaining: Duration(minutes: widget.quiz.timeLimitMinutes),
                                isSubmitted: false,
                              ),
                              startTime: DateTime.now(),
                            ),
                          ),
                        );
                      },
                      child: Text('Ambil Kuis'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Kembali Ke Kelas'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}