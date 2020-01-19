import 'package:flutter/material.dart';

import 'theme.dart';

/// I lights up or shuts down the passed text.
class NixieText extends StatelessWidget {
  /// Required.
  /// The text for which the light up/shut down effect will be applied
  final String text;

  /// Applies the light up effect if true or the shut down if false.
  /// It is false by default.
  final bool lightUp;

  const NixieText({
    Key key,
    @required this.text,
    this.lightUp = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return lightUp
        ? Text(
            text,
            style: theme.lightUpTextStyle,
          )
        : Opacity(
            opacity: 0.4,
            child: Text(
              this.text,
              style: theme.shutDownTextStyle,
            ),
          );
  }
}
