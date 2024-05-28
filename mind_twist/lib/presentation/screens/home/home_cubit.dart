// lib/presentation/screens/home/home_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_twist/presentation/screens/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  // You can add any logic related to the Home Screen here
  // Example: Fetching user data, updating UI based on data, etc.
}
