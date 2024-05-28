// lib/presentation/screens/teaser/score_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_twist/presentation/screens/teaser/score_cubit.dart';
import 'package:mind_twist/presentation/screens/teaser/score_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScoreScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ScoreScreen(
      {Key? key, required this.score, required this.totalQuestions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScoreCubit(
        score: score,
        totalQuestions: totalQuestions,
      ),
      child: BlocBuilder<ScoreCubit, ScoreState>(
        builder: (context, state) {
          if (state is ScoreStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ScoreStateFailure) {
            return Center(child: Text(state.message));
          } else if (state is ScoreStateSuccess) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your Score',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '$score / $totalQuestions',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () => context.goNamed('frame'),
                      child: Text(
                        'Go Back to Home',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
