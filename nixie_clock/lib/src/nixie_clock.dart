import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';

import 'nixie_time.dart';
import 'nixie_tube_digit.dart';
import 'nixie_tube_dot.dart';
import 'theme.dart';

///
/// A clock widget looking like a Nixie Tube clock.
///
class NixieClock extends StatefulWidget {
  const NixieClock(this.model);

  final ClockModel model;

  @override
  _NixieClockState createState() => _NixieClockState();
}

class _NixieClockState extends State<NixieClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(NixieClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final nixieTime = NixieTime(_dateTime, widget.model.is24HourFormat);
    final defaultStyle = theme.defaultTextStyle(context);
    return Container(
      color: theme.background(context),
      child: Center(
        child: DefaultTextStyle(
            style: defaultStyle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                NixieTubeDigit(
                  digit: nixieTime.hour.firstDigit,
                ),
                NixieTubeDigit(
                  digit: nixieTime.hour.secondDigit,
                ),
                NixieTubeDot(
                  isOn: nixieTime.tickSecond,
                ),
                NixieTubeDigit(digit: nixieTime.minute.firstDigit),
                NixieTubeDigit(
                  digit: nixieTime.minute.secondDigit,
                ),
              ],
            )),
      ),
    );
  }
}
