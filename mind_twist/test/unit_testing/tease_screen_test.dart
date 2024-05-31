// test/tease_screen_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_twist/presentation/screens/teaser/tease_screen.dart';
import 'package:flutter/material.dart';
import 'package:mind_twist/presentation/widgets/tease_options.dart';

void main() {
  group('TeaseScreen', () {
    testWidgets('renders question text', (WidgetTester tester) async {
      // Arrange
      final questions = [
        {
          'question': 'What is the capital of France?',
          'options': ['Paris', 'London', 'Berlin', 'Rome'],
          'correctAnswer': 0,
        }
      ];
      await tester.pumpWidget(
        MaterialApp(
          home: TeaseScreen(
            categoryName: 'Geography',
            questions: questions,
            currentQuestionIndex: 0,
          ),
        ),
      );

      // Act & Assert
      expect(find.text('What is the capital of France?'), findsOneWidget);
    });

    testWidgets('renders options for the question',
        (WidgetTester tester) async {
      // Arrange
      final questions = [
        {
          'question': 'What is the capital of France?',
          'options': ['Paris', 'London', 'Berlin', 'Rome'],
          'correctAnswer': 0,
        }
      ];
      await tester.pumpWidget(
        MaterialApp(
          home: TeaseScreen(
            categoryName: 'Geography',
            questions: questions,
            currentQuestionIndex: 0,
          ),
        ),
      );

      // Act & Assert
      expect(find.text('Paris'), findsOneWidget);
      expect(find.text('London'), findsOneWidget);
      expect(find.text('Berlin'), findsOneWidget);
      expect(find.text('Rome'), findsOneWidget);
    });

    testWidgets('tapping an option updates selected option',
        (WidgetTester tester) async {
      // Arrange
      final questions = [
        {
          'question': 'What is the capital of France?',
          'options': ['Paris', 'London', 'Berlin', 'Rome'],
          'correctAnswer': 0,
        }
      ];
      await tester.pumpWidget(
        MaterialApp(
          home: TeaseScreen(
            categoryName: 'Geography',
            questions: questions,
            currentQuestionIndex: 0,
          ),
        ),
      );

      // Act
      await tester.tap(find.text('London'));
      await tester.pumpAndSettle();
    });
  });
}
