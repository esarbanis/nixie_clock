import 'dart:ui';

import 'package:flutter/material.dart';

import 'theme.dart';

enum TubeSize { small, normal }

/// Encapsulates the visual depiction of a nixie tube.
class NixieTube extends StatelessWidget {
  /// Required.
  /// The widget to be placed inside this nixie tube.
  final Widget child;

  /// The size of the tube.
  /// If a tube is small then it is about 3 times narrower than the normal tube.
  final TubeSize size;

  const NixieTube({
    Key key,
    @required this.child,
    this.size = TubeSize.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipPath(
        clipper: TubeClipPath(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: Container(
            foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: theme.glassGradient,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                image: DecorationImage(
                    fit: BoxFit.none,
                    alignment: Alignment.bottomCenter,
                    image: AssetImage('images/nixie-tube-base.png'))),
            width: theme.tube(this.size).width(context),
            child: Container(
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  alignment: FractionalOffset.bottomCenter,
                  image: AssetImage(
                    'images/nixie-mesh${isSmall ? '-small' : ''}.png',
                  ),
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  bool get isSmall => size == TubeSize.small;
}

/// Clips the path to create the tube glass shape
class TubeClipPath extends CustomClipper<Path> {
  var _radius = 30.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(_radius, 0.0);
    path.arcToPoint(Offset(0.0, _radius),
        clockwise: false, radius: Radius.circular(_radius));
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, _radius);
    path.arcToPoint(Offset(size.width - _radius, 0.0),
        clockwise: false, radius: Radius.circular(_radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
