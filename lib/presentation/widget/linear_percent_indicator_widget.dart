import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearPercentIndicatorWidget extends StatelessWidget {

  final double percent;
  final MaterialColor color;

  LinearPercentIndicatorWidget({this.percent, this.color});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      animation: true,
      animationDuration: 1000,
      percent: percent,
      lineHeight: 15,
      backgroundColor: Colors.black45,
      progressColor: color,
    );
  }

}