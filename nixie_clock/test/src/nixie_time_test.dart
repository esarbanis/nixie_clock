import 'package:flutter_test/flutter_test.dart';
import 'package:nixie_clock/src/nixie_time.dart';

final _time = DateTime.parse('2020-01-01T13:30:00');

void main() {
  group('NixieTime', () {
    group('hour', () {
      test('should parse 24h format', () {
        final nixieTime = NixieTime(_time, true);

        expect(nixieTime.hour.firstDigit, '1');
        expect(nixieTime.hour.secondDigit, '3');
      });
      test('should parse 12h format', () {
        final nixieTime = NixieTime(_time, false);

        expect(nixieTime.hour.firstDigit, '0');
        expect(nixieTime.hour.secondDigit, '1');
      });
    });
    group('minute', () {
      // Although hour format is irrelevant for minutes we test on both cases
      // to verify no altered behavior is present
      test('should parse 24h format', () {
        final nixieTime = NixieTime(_time, true);

        expect(nixieTime.minute.firstDigit, '3');
        expect(nixieTime.minute.secondDigit, '0');
      });
      test('should parse 12h format', () {
        final nixieTime = NixieTime(_time, false);

        expect(nixieTime.minute.firstDigit, '3');
        expect(nixieTime.minute.secondDigit, '0');
      });
    });
    group('tickSecond', () {
      test('should tick in even seconds', () {
        final nixieTime = NixieTime(_time, true);

        expect(nixieTime.tickSecond, true);
      });
      test('should not tick in odd seconds', () {
        final nixieTime = NixieTime(_time.add(Duration(seconds: 1)), true);

        expect(nixieTime.tickSecond, false);
      });
    });
  });
}
