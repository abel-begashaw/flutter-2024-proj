import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_twist/presentation/widgets/category_options.dart';

void main() {
  testWidgets('CategoryOption displays category name and responds to tap',
      (WidgetTester tester) async {
    const categoryName = 'Science';
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: CategoryOption(
          categoryName: categoryName,
          onTap: () {
            tapped = true;
          },
        ),
      ),
    );

    // Verify the category name is displayed
    expect(find.text(categoryName), findsOneWidget);

    // Tap the widget
    await tester.tap(find.byType(CategoryOption));
    await tester.pump();

    // Verify the tap callback was triggered
    expect(tapped, true);
  });
}
