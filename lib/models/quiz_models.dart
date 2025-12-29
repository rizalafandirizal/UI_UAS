class Question {
  final int id;
  final String text;
  final List<String> options;
  final int correctAnswerIndex;

  const Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctAnswerIndex,
  });

  Question copyWith({
    int? id,
    String? text,
    List<String>? options,
    int? correctAnswerIndex,
  }) {
    return Question(
      id: id ?? this.id,
      text: text ?? this.text,
      options: options ?? this.options,
      correctAnswerIndex: correctAnswerIndex ?? this.correctAnswerIndex,
    );
  }
}

class Quiz {
  final String title;
  final List<Question> questions;
  final int timeLimitMinutes;
  final int totalQuestions;

  const Quiz({
    required this.title,
    required this.questions,
    required this.timeLimitMinutes,
    required this.totalQuestions,
  });

  Quiz copyWith({
    String? title,
    List<Question>? questions,
    int? timeLimitMinutes,
    int? totalQuestions,
  }) {
    return Quiz(
      title: title ?? this.title,
      questions: questions ?? this.questions,
      timeLimitMinutes: timeLimitMinutes ?? this.timeLimitMinutes,
      totalQuestions: totalQuestions ?? this.totalQuestions,
    );
  }
}

class QuizAttempt {
  final DateTime startTime;
  final DateTime? endTime;
  final Map<int, int> answers;
  final double? score;
  final bool isCompleted;

  const QuizAttempt({
    required this.startTime,
    this.endTime,
    required this.answers,
    this.score,
    required this.isCompleted,
  });

  QuizAttempt copyWith({
    DateTime? startTime,
    DateTime? endTime,
    Map<int, int>? answers,
    double? score,
    bool? isCompleted,
  }) {
    return QuizAttempt(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      answers: answers ?? this.answers,
      score: score ?? this.score,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class QuizState {
  final int currentQuestionIndex;
  final Map<int, int> selectedAnswers;
  final Duration timeRemaining;
  final bool isSubmitted;

  const QuizState({
    required this.currentQuestionIndex,
    required this.selectedAnswers,
    required this.timeRemaining,
    required this.isSubmitted,
  });

  QuizState copyWith({
    int? currentQuestionIndex,
    Map<int, int>? selectedAnswers,
    Duration? timeRemaining,
    bool? isSubmitted,
  }) {
    return QuizState(
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      timeRemaining: timeRemaining ?? this.timeRemaining,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }
}