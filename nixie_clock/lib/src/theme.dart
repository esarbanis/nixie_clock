import 'package:flutter/material.dart';
import 'package:nixie_clock/src/nixie_tube.dart';

const double _gradientOpacity = 0.15;
const double _offset = 8.0;
const double _blurRadius = 100.0;

/// Encapsulates the nixie clock's theme
class NixieTheme {
  final _fontSizeSpacer = 5.5;

  final List<Color> glassGradient;
  final TextStyle shutDownTextStyle;
  final TextStyle lightUpTextStyle;

  NixieTheme({
    this.glassGradient,
    this.shutDownTextStyle,
    this.lightUpTextStyle,
  });

  _fontSize(BuildContext context) =>
      MediaQuery.of(context).size.width / _fontSizeSpacer;

  defaultTextStyle(BuildContext context) => TextStyle(
        color: Colors.orange[400],
        fontFamily: 'NixieOne',
        fontSize: _fontSize(context),
      );

  tube(TubeSize size) => TubeWidth(size);

  background(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.blueGrey[700]
          : Colors.black26;
}

/// Encapsulates the logic of a nixie tube's width
class TubeWidth {
  final int _tubeWidthNormalSpacer = 7;
  final int _tubeWidthSmallSpacer = 22;

  /// If [TubeSize.small] then the width is going to be about 3 times narrower
  /// than [TubeSize.normal].
  final TubeSize size;

  TubeWidth(this.size);

  width(BuildContext context) =>
      MediaQuery.of(context).size.width /
      (this.size == TubeSize.normal
          ? _tubeWidthNormalSpacer
          : _tubeWidthSmallSpacer);
}

final _theme = NixieTheme(
  glassGradient: [
    Colors.white.withOpacity(_gradientOpacity),
    Colors.grey.shade500.withOpacity(_gradientOpacity),
    Colors.grey.shade800.withOpacity(_gradientOpacity),
    Colors.black.withOpacity(_gradientOpacity),
  ],
  shutDownTextStyle: TextStyle(color: Colors.grey[600]),
  lightUpTextStyle: TextStyle(shadows: <Shadow>[
    Shadow(
      color: Colors.red,
      blurRadius: _blurRadius,
      offset: Offset(_offset, _offset),
    ),
    Shadow(
      color: Colors.red,
      blurRadius: _blurRadius,
      offset: Offset(-_offset, _offset),
    ),
    Shadow(
      color: Colors.red,
      blurRadius: _blurRadius,
      offset: Offset(-_offset, -_offset),
    ),
    Shadow(
      color: Colors.red,
      blurRadius: _blurRadius,
      offset: Offset(_offset, -_offset),
    ),
  ]),
);

get theme => _theme;
