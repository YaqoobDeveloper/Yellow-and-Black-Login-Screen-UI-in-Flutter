import 'package:flutter/material.dart';

/// Coloured panel whose bottom edge bows downwards in a wide curve.
class CurvedPanel extends StatelessWidget {
  const CurvedPanel({
    super.key,
    required this.color,
    required this.child,
    this.curveDepth = 44,
  });

  final Color color;
  final Widget child;

  /// How far the middle of the bottom edge dips below its corners.
  final double curveDepth;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _BottomCurveClipper(curveDepth),
      child: ColoredBox(
        color: color,
        child: Padding(
          padding: EdgeInsets.only(bottom: curveDepth),
          child: child,
        ),
      ),
    );
  }
}

class _BottomCurveClipper extends CustomClipper<Path> {
  const _BottomCurveClipper(this.depth);

  final double depth;

  @override
  Path getClip(Size size) {
    final corner = size.height - depth;
    // A quadratic curve peaks halfway to its control point, so the control
    // point sits one extra [depth] below the bottom to touch it exactly.
    return Path()
      ..lineTo(0, corner)
      ..quadraticBezierTo(
        size.width / 2,
        size.height + depth,
        size.width,
        corner,
      )
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(_BottomCurveClipper oldClipper) =>
      oldClipper.depth != depth;
}
