import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:two_screen_app_assignment/main.dart';

void main() {
  testWidgets('home shows the welcome form', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Welcome'), findsOneWidget);
    expect(
      find.text('Enter your username or email to continue.'),
      findsOneWidget,
    );
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Username or email'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
    expect(find.byIcon(Icons.person_outline), findsOneWidget);
  });

  testWidgets('empty submit shows inline validation',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Continue'));
    await tester.pump();

    expect(find.text('Please enter a username or email.'), findsOneWidget);
    expect(find.text('About'), findsNothing);
  });

  testWidgets('trimmed username navigates to About and returns home',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField), '  Ada Lovelace  ');
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text('About'), findsOneWidget);
    expect(find.text('Ada Lovelace'), findsOneWidget);
    expect(
      find.text('You are viewing the about page for Ada Lovelace.'),
      findsOneWidget,
    );
    expect(find.byIcon(Icons.info_outline), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(find.text('Welcome'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}

