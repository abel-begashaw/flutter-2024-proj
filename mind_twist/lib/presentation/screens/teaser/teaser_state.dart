// lib/presentation/screens/teaser/teaser_state.dart
abstract class TeaserState {}

class TeaserStateInitial extends TeaserState {}

class TeaserStateLoading extends TeaserState {}

class TeaserStateSuccess extends TeaserState {
  final List<String> categories;

  TeaserStateSuccess({required this.categories});
}

class TeaserStateFailure extends TeaserState {
  final String message;

  TeaserStateFailure({required this.message});
}
