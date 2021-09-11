import 'package:flutter/material.dart';

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    Key key,
    @required this.top,
    @required this.left,
    @required this.heightWidth,
    this.rotation = 0,
    @required this.asset,
  }) : super(key: key);

  final double top;
  final double left;
  final double heightWidth;
  final double rotation;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Transform.rotate(
        angle: rotation,
        child: Container(
          height: heightWidth,
          width: heightWidth,
          child: Image.asset(
            "assets/$asset",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
