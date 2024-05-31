// test/update_profile_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_twist/presentation/screens/profile/update_profile.dart';
import 'package:flutter/material.dart';

void main() {
  group('UpdateProfilePage', () {
    testWidgets('renders Update Profile title', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: UpdateProfilePage()));

      // Act & Assert
      expect(find.text('Update Profile'), findsOneWidget);
    });

    testWidgets('renders password input field', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: UpdateProfilePage()));

      // Act & Assert
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.text('Enter new password'), findsOneWidget);
    });

    testWidgets('renders Delete Account button', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: UpdateProfilePage()));

      // Act & Assert
      expect(find.text('Delete Account'), findsOneWidget);
    });
  });
}
