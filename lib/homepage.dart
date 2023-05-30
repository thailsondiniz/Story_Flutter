import 'package:flutter/material.dart';
import 'package:flutter_project3/storypage.dart';
import 'package:flutter_project3/util/story_circulo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _openStory(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StoryPage(),),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Hello'),
      ),
      body: Column(children: [
        SizedBox(
          height:100,
          child:ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return StoryCirculo(
                function: _openStory,
              );
           },),
        ),
      ]),
    );
  }
}