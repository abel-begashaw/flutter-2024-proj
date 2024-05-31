import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_twist/presentation/widgets/quiz_options.dart';

void main() {
  testWidgets('Option displays option text and responds to press',
      (WidgetTester tester) async {
    const optionText = 'Paris';
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Option(
          optionText: optionText,
          onPressed: () {
            pressed = true;
          },
        ),
      ),
    );

    // Verify the option text is displayed
    expect(find.text(optionText), findsOneWidget);

    // Tap the button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify the press callback was triggered
    expect(pressed, true);
  });
}
