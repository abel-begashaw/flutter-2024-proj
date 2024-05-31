// test/home_screen_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_twist/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_twist/presentation/screens/home/home_cubit.dart';
import 'package:mind_twist/presentation/screens/home/home_state.dart';
import 'package:mockito/mockito.dart';
import 'package:go_router/go_router.dart';

class MockHomeCubit extends Mock implements HomeCubit {}

void main() {
  group('HomeScreen', () {
    late MockHomeCubit mockHomeCubit;

    setUp(() {
      mockHomeCubit = MockHomeCubit();
    });

    testWidgets('renders Welcome text', (WidgetTester tester) async {
      // Arrange
      when(mockHomeCubit.state).thenReturn(HomeState.initial());
      await tester.pumpWidget(
        BlocProvider<HomeCubit>(
          create: (context) => mockHomeCubit,
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      // Act & Assert
      expect(find.text('Welcome to Brain Teaser'), findsOneWidget);
    });

    testWidgets('renders Daily Twist button', (WidgetTester tester) async {
      // Arrange
      when(mockHomeCubit.state).thenReturn(HomeState.initial());
      await tester.pumpWidget(
        BlocProvider<HomeCubit>(
          create: (context) => mockHomeCubit,
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      // Act & Assert
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Daily Twist'), findsOneWidget);
    });

    testWidgets('Daily Twist button navigates to teaser screen',
        (WidgetTester tester) async {
      // Arrange
      when(mockHomeCubit.state).thenReturn(HomeState.initial());
      await tester.pumpWidget(
        BlocProvider<HomeCubit>(
          create: (context) => mockHomeCubit,
          child: MaterialApp(
            home: const HomeScreen(),
            onGenerateRoute: (settings) {
              if (settings.name == '/teaser') {
                return MaterialPageRoute(
                    builder: (context) => const SizedBox());
              }
              return null;
            },
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Daily Twist'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(SizedBox), findsOneWidget);
    });
  });
}
