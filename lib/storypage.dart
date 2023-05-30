import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project3/stories/story_1.dart';
import 'package:flutter_project3/stories/story_2.dart';
import 'package:flutter_project3/stories/story_3.dart';
import 'package:flutter_project3/util/story_bar.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentStoryIndex = 0;
  final List<Widget> myStories = [
    const MyStory1(), //0
    const MyStory2(), //1
    const MyStory3(), //2
  ];

  List<double> percentWatched = [];
  @override
  void initState(){
    super.initState();

    for (int i = 0; i < myStories.length; i++){
      percentWatched.add(0);
    }

    _startWatching();
  }
  
  void _startWatching(){
    Timer.periodic(const Duration(milliseconds: 50), (timer){
      setState(() {
        if(percentWatched[currentStoryIndex] + 0.01 < 1){
          percentWatched[currentStoryIndex] += 0.01;
        }

        else{
          percentWatched[currentStoryIndex] = 1;
          timer.cancel();

          if(currentStoryIndex < myStories.length -1){
            currentStoryIndex++;
            _startWatching();
          }
          else{
            Navigator.pop(context);
          }
        }
      });
    });
  }

  void _onTapDown(TapDownDetails details){
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    

    if(dx < screenWidth / 2){
      setState(() {
        if(currentStoryIndex > 0){
          percentWatched[currentStoryIndex - 1] = 0;
          percentWatched[currentStoryIndex] = 0;

          currentStoryIndex--;
        }
      });
    }

    else{
      setState(() {
        if(currentStoryIndex < myStories.length -1){
          percentWatched[currentStoryIndex] = 1;

          currentStoryIndex ++;
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      child: Scaffold(
        body: Stack(
          children: [
            myStories[currentStoryIndex],
               MyStoryBars(
                percentWatched: percentWatched,
               ),
          ],
        ),
      ),
    );
  }
}