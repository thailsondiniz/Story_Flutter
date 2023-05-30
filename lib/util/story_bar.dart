import 'package:flutter/material.dart';
import 'package:flutter_project3/util/progress_bar.dart';

class MyStoryBars extends StatelessWidget {
  List<double> percentWatched = [];


  MyStoryBars({super.key, required this.percentWatched});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(top:60, left:8, right:8),
      child:Row(
        children: [
          Expanded(child: MyProgressBar(percentWatched: percentWatched[0]),),
          Expanded(child: MyProgressBar(percentWatched: percentWatched[1]),),
          Expanded(child: MyProgressBar(percentWatched: percentWatched[2]),),
        ],
      ),
    );
  }
}