import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mind_twist/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('AdminPage Integration Tests', () {
    testWidgets('Create, promote/demote, and delete a user',
        (WidgetTester tester) async {
      // Launch the app
      await tester.pumpWidget(const MyApp());

      // Navigate to AdminPage (assuming it is in MainContainer)
      await tester.tap(find.text('Admin'));
      await tester.pumpAndSettle();

      // Find the "Create User" button and tap it
      final createUserButton = find.text('Create User');
      expect(createUserButton, findsOneWidget);
      await tester.tap(createUserButton);
      await tester.pumpAndSettle();

      // Enter a new username and password
      await tester.enterText(find.byType(TextFormField).at(0), 'newUser');
      await tester.enterText(find.byType(TextFormField).at(1), 'newPassword');

      // Find the "Create" button in the dialog and tap it
      final createButton = find.text('Create');
      await tester.tap(createButton);
      await tester.pumpAndSettle();

      // Verify the user is added
      expect(find.text('newUser'), findsOneWidget);

      // Find the promote/demote button for the new user and tap it
      final promoteButton = find.descendant(
        of: find.widgetWithText(ListTile, 'newUser'),
        matching: find.byIcon(Icons.admin_panel_settings),
      );
      await tester.tap(promoteButton);
      await tester.pumpAndSettle();

      // Verify the role is changed to 'admin'
      expect(find.textContaining('Role: admin'), findsOneWidget);

      // Find the delete button for the new user and tap it
      final deleteButton = find.descendant(
        of: find.widgetWithText(ListTile, 'newUser'),
        matching: find.byIcon(Icons.delete),
      );
      await tester.tap(deleteButton);
      await tester.pumpAndSettle();

      // Verify the user is removed
      expect(find.text('newUser'), findsNothing);
    });
  });
}
