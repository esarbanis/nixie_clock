import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nixie_clock/src/nixie_text.dart';

void main() {
  group('NixieText', () {
    testWidgets('should display the passed text', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NixieText(
          text: 'A',
        ),
      ));

      final text = find.text('A');
      expect(text, findsOneWidget);
    });

    testWidgets('should be shut down by default', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NixieText(
          text: 'A',
        ),
      ));

      final shutDownText = find.byType(Opacity);
      expect(shutDownText, findsOneWidget);
    });

    testWidgets('should be light up when lightUp is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NixieText(
          lightUp: true,
          text: 'A',
        ),
      ));

      final shutDownText = find.byType(Opacity);
      final lighUpText = find.byType(Text);
      expect(shutDownText, findsNothing);
      expect(lighUpText, findsOneWidget);
    });
  });
}
