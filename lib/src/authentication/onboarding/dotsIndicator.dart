import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int dotsCount;
  final double position;

  const DotIndicator({super.key, required this.dotsCount, this.position = 0.0});

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: const DotsDecorator(
        color: Colors.white,
        activeColor: Colors.red,
        shape: CircleBorder(),
        size: Size(10.0, 10.0),
        activeSize: Size(10.0, 10.0),
        activeShape: CircleBorder(),
      ),
    );
  }

}