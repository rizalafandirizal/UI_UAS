import 'dart:async';
import 'package:flutter/material.dart';
import '../models/quiz_models.dart';
import 'quiz_review_screen.dart';

class QuizQuestionScreen extends StatefulWidget {
  final Quiz quiz;
  final QuizState initialState;
  final DateTime startTime;

  const QuizQuestionScreen({
    Key? key,
    required this.quiz,
    required this.initialState,
    required this.startTime,
  }) : super(key: key);

  @override
  _QuizQuestionScreenState createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  late QuizState _quizState;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _quizState = widget.initialState;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_quizState.timeRemaining.inSeconds > 0) {
          _quizState = _quizState.copyWith(
            timeRemaining: _quizState.timeRemaining - Duration(seconds: 1),
          );
        } else {
          _finishQuiz();
        }
      });
    });
  }

  void _selectAnswer(int optionIndex) {
    final questionId = widget.quiz.questions[_quizState.currentQuestionIndex].id;
    final updatedAnswers = Map<int, int>.from(_quizState.selectedAnswers);
    updatedAnswers[questionId] = optionIndex;
    setState(() {
      _quizState = _quizState.copyWith(selectedAnswers: updatedAnswers);
    });
  }

  void _goToPrevious() {
    if (_quizState.currentQuestionIndex > 0) {
      setState(() {
        _quizState = _quizState.copyWith(
          currentQuestionIndex: _quizState.currentQuestionIndex - 1,
        );
      });
    }
  }

  void _goToNext() {
    if (_quizState.currentQuestionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        _quizState = _quizState.copyWith(
          currentQuestionIndex: _quizState.currentQuestionIndex + 1,
        );
      });
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    _timer?.cancel();
    final completedState = _quizState.copyWith(isSubmitted: true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizReviewScreen(
          quiz: widget.quiz,
          quizState: completedState,
          startTime: widget.startTime,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.quiz.questions[_quizState.currentQuestionIndex];
    final isLastQuestion = _quizState.currentQuestionIndex == widget.quiz.questions.length - 1;

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
                  '${_quizState.timeRemaining.inMinutes.toString().padLeft(2, '0')}:${(_quizState.timeRemaining.inSeconds % 60).toString().padLeft(2, '0')}',
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
              // Progress Indicator
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.quiz.questions.length,
                  itemBuilder: (context, index) {
                    final questionId = widget.quiz.questions[index].id;
                    final isAnswered = _quizState.selectedAnswers.containsKey(questionId);
                    final isCurrent = index == _quizState.currentQuestionIndex;
                    return Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isAnswered ? Colors.green : Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: isCurrent ? 3 : 1,
                        ),
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
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              // Question Info
              Text(
                'Soal Nomor ${_quizState.currentQuestionIndex + 1} / ${widget.quiz.questions.length}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Question Text
              Text(
                currentQuestion.text,
                style: TextStyle(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.left,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 20),
              // Options
              Expanded(
                child: ListView.builder(
                  itemCount: currentQuestion.options.length,
                  itemBuilder: (context, index) {
                    final isSelected = _quizState.selectedAnswers[currentQuestion.id] == index;
                    return GestureDetector(
                      onTap: () => _selectAnswer(index),
                      child: Card(
                        color: isSelected ? Colors.pink : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            currentQuestion.options[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              // Navigation Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _quizState.currentQuestionIndex > 0 ? _goToPrevious : null,
                      child: Text('Soal Sebelumnya'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _goToNext,
                      child: Text(isLastQuestion ? 'Selesai' : 'Soal Selanjutnya'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isLastQuestion ? Colors.green : Colors.blue,
                        foregroundColor: Colors.white,
                      ),
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