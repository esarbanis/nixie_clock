import 'package:flutter/material.dart';

import 'nixie_text.dart';
import 'nixie_tube.dart';

final List<String> _digits =
    Iterable<int>.generate(10).map((int num) => num.toString()).toList();

/// Widget to present a digit inside a nixie tube.
class NixieTubeDigit extends StatelessWidget {
  /// The digit to light up inside the nixie tube.
  final String digit;

  const NixieTubeDigit({
    Key key,
    @required this.digit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NixieTube(
      child: Stack(
        alignment: Alignment.center,
        children: _digits
            .map((digitFromList) => digitFromList == digit
                ? NixieText(
                    key: Key('lightUp$digit'),
                    lightUp: true,
                    text: digit,
                  )
                : NixieText(
                    key: Key('shutDown$digitFromList'),
                    text: digitFromList,
                  ))
            .toList(),
      ),
    );
  }
}
