import 'package:flutter/material.dart';

class CustomNavigationBarPainter extends CustomPainter {
  late double span;
  late double position;

  /// Depth of bucket in percentage of bottom bar height
  late double depth;

  /// Opening width of a bucket
  late double bucketOpeningWidth;

  late Color bottomBarColor;

  CustomNavigationBarPainter(
      {required this.position,
      required int itemCount,
      this.depth = 0.65,
      this.bottomBarColor = Colors.white,
      this.bucketOpeningWidth = 0.05}) {
    span = 1.0 / itemCount;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = bottomBarColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((position + bucketOpeningWidth) * size.width, 0)
      ..relativeCubicTo(40, 0, 0, size.height * depth,
          (span / 2 - bucketOpeningWidth) * size.width, size.height * depth)
      ..relativeCubicTo(
          (span / 2 - bucketOpeningWidth) * size.width,
          -size.height * depth + size.height * depth,
          (span / 2 - bucketOpeningWidth) * size.width - 40,
          -size.height * depth,
          (span / 2 - bucketOpeningWidth) * size.width,
          -size.height * depth)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => this != oldDelegate;
}
