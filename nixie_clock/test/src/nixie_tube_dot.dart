import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nixie_clock/src/nixie_tube_dot.dart';

void main() {
  group('NixieTubeDot', () {
    testWidgets('should display a small tube', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NixieTubeDot(),
      ));

      final smallTube = find.byKey(Key('NixieTubeSmall'));
      expect(smallTube, findsOneWidget);
    });
    testWidgets('should display a dot', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NixieTubeDot(),
      ));

      final dot = find.text('.');
      expect(dot, findsOneWidget);
    });
    testWidgets('should display a light up dot by default',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NixieTubeDot(),
      ));

      final shutDownText = find.byType(Opacity);
      final lighUpText = find.byType(Text);
      expect(shutDownText, findsNothing);
      expect(lighUpText, findsOneWidget);
    });
    testWidgets('should display a shut down dot', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NixieTubeDot(
          isOn: false,
        ),
      ));

      final shutDownText = find.byType(Opacity);
      expect(shutDownText, findsOneWidget);
    });
  });
}
