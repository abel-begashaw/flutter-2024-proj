// lib/presentation/screens/teaser/score_state.dart
abstract class ScoreState {}

class ScoreStateInitial extends ScoreState {}

class ScoreStateLoading extends ScoreState {}

class ScoreStateSuccess extends ScoreState {}

class ScoreStateFailure extends ScoreState {
  final String message;

  ScoreStateFailure({required this.message});
}
