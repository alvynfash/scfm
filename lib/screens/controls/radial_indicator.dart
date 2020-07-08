import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RadialIndicator extends StatefulWidget {
  final double radius;
  final double percent;
  final String text;
  final Color bgColor;
  final Color progressColor;

  RadialIndicator(
      {this.radius = 60,
      this.percent = .0,
      this.text = '',
      this.bgColor = Colors.grey,
      this.progressColor = Colors.green,
      Key key})
      : super(key: key);

  @override
  _RadialIndicatorState createState() => _RadialIndicatorState();
}

class _RadialIndicatorState extends State<RadialIndicator> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: widget.radius,
      animation: true,
      animationDuration: 400,
      lineWidth: 10,
      percent: widget.percent,
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: widget.bgColor,
      progressColor: widget.progressColor,
      center: Text(
        widget.text,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
