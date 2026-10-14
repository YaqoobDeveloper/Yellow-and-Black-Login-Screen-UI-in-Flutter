import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_screen/app.dart';

void main() {
  setUp(() => GoogleFonts.config.allowRuntimeFetching = false);

  Future<void> pumpApp(WidgetTester tester) async {
    tester.view.physicalSize = const Size(402, 874);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const App());
  }

  testWidgets('Login with empty fields shows validation errors', (
    tester,
  ) async {
    await pumpApp(tester);

    await tester.tap(find.text('LOGIN'));
    await tester.pump();
    expect(find.text('Please enter your email or username'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });

  testWidgets('Invalid email is rejected', (tester) async {
    await pumpApp(tester);

    await tester.enterText(find.byType(TextFormField).at(0), 'khalil@gmail');
    await tester.enterText(find.byType(TextFormField).at(1), 'secret123');
    await tester.tap(find.text('LOGIN'));
    await tester.pump();
    expect(find.text('Please enter a valid email'), findsOneWidget);
  });

  testWidgets('Valid username login shows a confirmation', (tester) async {
    await pumpApp(tester);

    await tester.enterText(find.byType(TextFormField).at(0), 'khalil');
    await tester.enterText(find.byType(TextFormField).at(1), 'secret123');
    await tester.tap(find.text('LOGIN'));
    await tester.pump();
    expect(find.text('Logged in as khalil'), findsOneWidget);
  });

  testWidgets('Sign up button shows a message', (tester) async {
    await pumpApp(tester);

    await tester.ensureVisible(find.text('SIGN UP'));
    await tester.tap(find.text('SIGN UP'));
    await tester.pump();
    expect(find.text('Sign up coming soon'), findsOneWidget);
  });
}
