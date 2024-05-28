// lib/presentation/screens/home/home_state.dart
enum HomeStatus { initial }

class HomeState {
  final HomeStatus status;

  HomeState({required this.status});

  factory HomeState.initial() {
    return HomeState(status: HomeStatus.initial);
  }
}
