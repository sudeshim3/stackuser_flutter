import 'package:flutter/material.dart';
import 'dart:math';

class CircularRevealPainter extends CustomPainter{

  double _fraction;
  Size _screenSize;
  double circleIntialRadius = 15.0;

  CircularRevealPainter(this._fraction, this._screenSize);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.blue;

    var finalRadius = sqrt(pow(_screenSize.width - 32.0, 2) + pow(_screenSize.height + 32.0, 2));
    var currentRadius = circleIntialRadius + (finalRadius - circleIntialRadius) * _fraction;
    canvas.drawCircle(Offset(size.width/2, size.height/2), currentRadius, paint);
  }

  @override
  bool shouldRepaint(CircularRevealPainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }

}