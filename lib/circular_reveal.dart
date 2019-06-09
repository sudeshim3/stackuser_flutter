import 'package:flutter/material.dart';
import 'package:stackuser_flutter/circular_reveal_painter.dart';
import 'dart:async';

class CircularReveal extends StatefulWidget {
  @override
  _CircularRevealState createState() => _CircularRevealState();
}

class _CircularRevealState extends State<CircularReveal>
    with TickerProviderStateMixin {
  Animation _animation;
  double _fraction = 0.0;
  bool iconActivated = false;
  IconData profileIcon = Icons.account_circle;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: CustomPaint(
        painter: CircularRevealPainter(_fraction, MediaQuery.of(context).size),
        child: IconButton(
          icon: Icon(
            profileIcon,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () => {reveal()},
        ),
      ),
    );
  }

  void reveal() {

    AnimationController controller =
    AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    double beginVal = 0.0;
    double endVal = 1.0;
    setState(() {
      iconActivated = !iconActivated;
      if(iconActivated) {
        profileIcon = Icons.close;
        beginVal = 0.0;
        endVal = 1.0;
      }
      else {
        Timer(const Duration(milliseconds:300), () {
          profileIcon = Icons.account_circle;
        });
        beginVal = 1.0;
        endVal = 0.0;
      }
      controller.forward();
    });


    _animation = Tween(begin: beginVal, end: endVal).animate(controller)
      ..addListener(() {
        setState(() {
          _fraction = _animation.value;
        });
      });
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
