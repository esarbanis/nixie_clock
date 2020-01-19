import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nixie_clock/src/nixie_tube_digit.dart';

void main() {
  group('NixieTubeDigit', () {
    testWidgets('should display the passed digit', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NixieTubeDigit(
          digit: '1',
        ),
      ));

      final shutDownText = find.text('1');
      expect(shutDownText, findsOneWidget);
    });
    testWidgets('should light up the passed digit',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: NixieTubeDigit(
          digit: '1',
        ),
      ));

      final lightUptext = find.byKey(Key('lightUp1'));
      expect(lightUptext, findsOneWidget);
    });
    testWidgets('should keep all shut down except the passed digit',
        (WidgetTester tester) async {
      final selectedDigit = 1;

      await tester.pumpWidget(MaterialApp(
        home: NixieTubeDigit(
          digit: '$selectedDigit',
        ),
      ));

      final List<String> digits = Iterable<int>.generate(10)
          .where((d) => d != selectedDigit)
          .map((int num) => num.toString())
          .toList();

      digits.forEach(
          (digit) => expect(find.byKey(Key('shutDown$digit')), findsOneWidget));
    });
  });
}
