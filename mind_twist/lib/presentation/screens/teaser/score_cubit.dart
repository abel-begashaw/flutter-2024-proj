// lib/presentation/screens/teaser/score_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_twist/presentation/screens/teaser/score_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit({required this.score, required this.totalQuestions})
      : super(ScoreStateInitial());

  final int score;
  final int totalQuestions;

  Future<void> saveScore() async {
    emit(ScoreStateLoading());
    try {
      final response = await http.post(
        Uri.parse('http://192.168.42.1:3000/api/scores'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'score': score, 'totalQuestions': totalQuestions}),
      );
      if (response.statusCode == 201) {
        emit(ScoreStateSuccess());
      } else {
        emit(ScoreStateFailure(message: 'Failed to save score'));
      }
    } catch (error) {
      emit(ScoreStateFailure(message: 'Error saving score: $error'));
    }
  }

  @override
  Future<void> close() async {
    super.close();
  }
}
