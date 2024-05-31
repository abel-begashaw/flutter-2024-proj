import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mind_twist/main.dart'; // Import your main.dart file
// Import your admin_page.dart file

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test for Your App', (WidgetTester tester) async {
    // Start the app
    await tester.pumpWidget(MyApp());

    // Navigate to Admin Page
    await tester.tap(find.byIcon(Icons.admin_panel_settings));
    await tester.pumpAndSettle();

    // Perform actions on Admin Page
    await tester.tap(find.byKey(Key('adminPageButton')));
    await tester.pumpAndSettle();

    // Navigate to Update Profile Page
    await tester.tap(find.byIcon(Icons.update));
    await tester.pumpAndSettle();

    // Perform actions on Update Profile Page
    await tester.enterText(
        find.byKey(Key('updateProfileTextField')), 'New Profile Name');
    await tester.tap(find.byKey(Key('saveProfileButton')));
    await tester.pumpAndSettle();

    // Navigate to Quiz Screen
    await tester.tap(find.byIcon(Icons.quiz));
    await tester.pumpAndSettle();

    // Perform actions on Quiz Screen
    await tester.tap(find.byKey(Key('startQuizButton')));
    await tester.pumpAndSettle();

    // Answer a question
    await tester.tap(find.byKey(Key('answer1')));
    await tester.tap(find.byKey(Key('submitAnswerButton')));
    await tester.pumpAndSettle();

    // Navigate to Teaser Screen
    await tester.tap(find.byIcon(Icons.theater_comedy));
    await tester.pumpAndSettle();

    // Perform actions on Teaser Screen
    await tester.tap(find.byKey(Key('playTeaserButton')));
    await tester.pumpAndSettle();
  });
}
