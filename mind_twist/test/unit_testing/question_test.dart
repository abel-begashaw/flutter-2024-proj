// test/question_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_twist/presentation/widgets/question_widget.dart';

void main() {
  testWidgets('Question displays question text', (WidgetTester tester) async {
    const questionText = 'What is the capital of France?';

    await tester.pumpWidget(
      const MaterialApp(
        home: Question(questionText: questionText),
      ),
    );

    // Verify the question text is displayed
    expect(find.text(questionText), findsOneWidget);
  });
}
