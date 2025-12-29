import 'package:layoutuas/models/quiz_models.dart';

const Quiz quizData = Quiz(
  title: "Quiz Review 1",
  timeLimitMinutes: 15,
  totalQuestions: 15,
  questions: [
    Question(
      id: 1,
      text: "What is the capital of France?",
      options: ["Paris", "London", "Berlin", "Madrid"],
      correctAnswerIndex: 0,
    ),
    Question(
      id: 2,
      text: "What is 2 + 2?",
      options: ["3", "4", "5", "6"],
      correctAnswerIndex: 1,
    ),
    Question(
      id: 3,
      text: "Who wrote Romeo and Juliet?",
      options: ["Shakespeare", "Dickens", "Austen", "Twain"],
      correctAnswerIndex: 0,
    ),
    Question(
      id: 4,
      text: "What is H2O commonly known as?",
      options: ["Water", "Oxygen", "Hydrogen", "Carbon"],
      correctAnswerIndex: 0,
    ),
    Question(
      id: 5,
      text: "In what year did World War II end?",
      options: ["1945", "1939", "1950", "1940"],
      correctAnswerIndex: 0,
    ),
    Question(
      id: 6,
      text: "What is the largest planet in our solar system?",
      options: ["Earth", "Jupiter", "Mars", "Venus"],
      correctAnswerIndex: 1,
    ),
    Question(
      id: 7,
      text: "What is 10% of 100?",
      options: ["5", "10", "15", "20"],
      correctAnswerIndex: 1,
    ),
    Question(
      id: 8,
      text: "Who painted the Mona Lisa?",
      options: ["Leonardo da Vinci", "Pablo Picasso", "Vincent van Gogh", "Rembrandt"],
      correctAnswerIndex: 0,
    ),
    Question(
      id: 9,
      text: "What is the chemical symbol for gold?",
      options: ["Au", "Ag", "Fe", "Cu"],
      correctAnswerIndex: 0,
    ),
    Question(
      id: 10,
      text: "What is the square root of 16?",
      options: ["4", "5", "6", "3"],
      correctAnswerIndex: 0,
    ),
    Question(
      id: 11,
      text: "Which ocean is the largest?",
      options: ["Atlantic", "Pacific", "Indian", "Arctic"],
      correctAnswerIndex: 1,
    ),
    Question(
      id: 12,
      text: "What is 7 multiplied by 8?",
      options: ["54", "56", "58", "60"],
      correctAnswerIndex: 1,
    ),
    Question(
      id: 13,
      text: "Who discovered penicillin?",
      options: ["Alexander Fleming", "Marie Curie", "Albert Einstein", "Charles Darwin"],
      correctAnswerIndex: 0,
    ),
    Question(
      id: 14,
      text: "What is the color of the sky on a clear day?",
      options: ["Green", "Blue", "Red", "Yellow"],
      correctAnswerIndex: 1,
    ),
    Question(
      id: 15,
      text: "What is the capital of Japan?",
      options: ["Beijing", "Seoul", "Bangkok", "Tokyo"],
      correctAnswerIndex: 3,
    ),
  ],
);