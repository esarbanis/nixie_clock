import 'package:flutter/material.dart';
import 'package:nixie_clock/src/nixie_text.dart';

import 'nixie_tube.dart';

/// Widget to present a dot inside a nixie tube.
class NixieTubeDot extends StatelessWidget {
  /// Whether to light up the dot or not.
  /// It is true by default.
  final bool isOn;

  const NixieTubeDot({
    Key key,
    this.isOn = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NixieTube(
      key: Key('NixieTubeSmall'),
      size: TubeSize.small,
      child: NixieText(
        lightUp: isOn,
        text: '.',
      ),
    );
  }
}
