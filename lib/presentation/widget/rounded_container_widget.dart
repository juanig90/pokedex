import 'package:flutter/material.dart';

class RoundedContainerWidget extends StatelessWidget {
  final String text;

  RoundedContainerWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
          child: Text(
            text,
            style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),
          ),
        ),
      ),
    );
  }
}
