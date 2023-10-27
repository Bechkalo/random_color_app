// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_app/my_app.dart';

void main() {
  testWidgets(
    'Change background and text colors test',
    (WidgetTester tester) async {
      /// To pass this test, our background must not be white (default value)
      /// and our text must not be black (default).

      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      //Check if background is white.
      expect(
        find.byWidgetPredicate(
          (Widget widget) => widget is Material && widget.color == Colors.white,
          description: 'Background is white.',
        ),
        findsOneWidget,
      );
      //Check if text is black.
      expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is Text && widget.style?.color == Colors.black,
          description: 'Text is black.',
        ),
        findsOneWidget,
      );

      // Tap the text widget.
      await tester.tap(find.byType(Text));
      await tester.pump();

      // Verify that the colors have been changed.
      expect(
        find.byWidgetPredicate(
          (Widget widget) => widget is Material && widget.color == Colors.white,
          description: "Background isn't white.",
        ),
        findsNothing,
      );

      expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is Text && widget.style?.color == Colors.black,
          description: "Text isn't white.",
        ),
        findsNothing,
      );
    },
  );
}
