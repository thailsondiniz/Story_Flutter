import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyProgressBar extends StatelessWidget {
  double percentWatched = 0;

  MyProgressBar({super.key, required this.percentWatched});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight:15,
      percent:percentWatched,
      progressColor: Colors.grey[400],
      backgroundColor: Colors.grey[600],
      barRadius: const Radius.circular(60),
    );
  }
}