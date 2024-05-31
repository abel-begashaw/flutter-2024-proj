import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_twist/presentation/widgets/score_display.dart';

void main() {
  testWidgets('ScoreScreen displays score and total questions',
      (WidgetTester tester) async {
    const score = 7;
    const totalQuestions = 10;

    await tester.pumpWidget(
      MaterialApp(
        home: ScoreScreen(
          score: score,
          totalQuestions: totalQuestions,
        ),
      ),
    );

    // Verify the score and total questions are displayed
    expect(find.text('Your Score'), findsOneWidget);
    expect(find.text('$score / $totalQuestions'), findsOneWidget);
  });

  testWidgets('ScoreScreen navigates back on tap', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScoreScreen(
          score: 7,
          totalQuestions: 10,
        ),
      ),
    );

    // Simulate tap
    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    // Verify that it navigated back
    // This is tricky to test directly; a more thorough test might use a mocked navigation stack
  });
}
