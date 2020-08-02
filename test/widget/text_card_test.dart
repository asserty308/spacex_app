// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spacex_guide/core/ui/widgets/text_card.dart';

void main() {
  testWidgets('TextCard should show text', (WidgetTester tester) async {
    const testText = 'Testing functionality for the TextCard widget.';
    const failText = 'This tests "test can fail" condition.';

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: TextCard(
        text: testText,
      ),
    ));

    // Verify that the widget shows the correct text and the test works as expected
    expect(find.text(testText), findsOneWidget);
    expect(find.text(failText), findsNothing);
  });
}
