import 'package:flutter_bloc/flutter_bloc.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial());

  Map<String, List<Map<String, dynamic>>> categoryQuestions = {};

  @override
  Stream<QuizState> mapEventToState(
    QuizEvent event,
  ) async* {
    if (event is StartQuiz) {
      yield QuizInProgress(
        currentQuestionIndex: 0,
        score: 0,
        questions: categoryQuestions[event.categoryName]!,
      );
    } else if (event is AnswerSelected) {
      final currentQuestionIndex = state.currentQuestionIndex!;
      final questions = state.questions!;
      final correctAnswer =
          questions[currentQuestionIndex]['correctAnswer'] as int;
      final updatedScore = event.isCorrect ? state.score! + 1 : state.score!;
      if (currentQuestionIndex < questions.length - 1) {
        yield QuizInProgress(
          currentQuestionIndex: currentQuestionIndex + 1,
          score: updatedScore,
          questions: questions,
        );
      } else {
        yield QuizCompleted(
          score: updatedScore,
          totalQuestions: questions.length,
        );
      }
    }
  }
}

abstract class QuizEvent {}

class StartQuiz extends QuizEvent {
  final String categoryName;

  StartQuiz({required this.categoryName});
}

class AnswerSelected extends QuizEvent {
  final bool isCorrect;

  AnswerSelected({required this.isCorrect});
}

abstract class QuizState {
  final int? currentQuestionIndex; // Add this
  final int? score; // Add this
  final List<Map<String, dynamic>>? questions; // Add this

  QuizState({this.currentQuestionIndex, this.score, this.questions});
}

class QuizInitial extends QuizState {}

class QuizInProgress extends QuizState {
  final int currentQuestionIndex;
  final int score;
  final List<Map<String, dynamic>> questions;

  QuizInProgress({
    required this.currentQuestionIndex,
    required this.score,
    required this.questions,
  });
}

class QuizCompleted extends QuizState {
  final int score;
  final int totalQuestions;

  QuizCompleted({
    required this.score,
    required this.totalQuestions,
  });
}
