import 'package:intl/intl.dart';

/// Encapsulates the the time parsing logic for nixie clock.
class NixieTime {
  /// Contains the hour parsing logic of nixie clock.
  final NixieHour hour;

  /// Contains the minute parsing logic of nixie clock.
  final NixieMinute minute;

  /// True in even seconds, false in odd seconds.
  final bool tickSecond;

  NixieTime(DateTime time, bool is24HourFormat)
      : this.hour =
            NixieHour(DateFormat(is24HourFormat ? 'HH' : 'hh').format(time)),
        this.minute = NixieMinute(DateFormat('mm').format(time)),
        this.tickSecond = time.second % 2 == 0;
}

/// Encapsulates the the hour parsing logic for nixie clock
class NixieHour {
  final _hour;

  NixieHour(this._hour);

  get firstDigit => _hour.substring(0, 1);

  get secondDigit => _hour.substring(1, 2);
}

/// Encapsulates the the minute parsing logic for nixie clock
class NixieMinute {
  final _minute;

  NixieMinute(this._minute);

  get firstDigit => _minute.substring(0, 1);

  get secondDigit => _minute.substring(1, 2);
}
