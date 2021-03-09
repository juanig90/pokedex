import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'linear_percent_indicator_widget.dart';

class StatWidget extends StatelessWidget {
  final String statName;

  StatWidget(this.statName);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            statName,
            textAlign: TextAlign.end,
          ),
        ),
        Spacer(),
        Expanded(
          flex: 10,
          child: LinearPercentIndicatorWidget(
            percent: Random().nextDouble(),
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
