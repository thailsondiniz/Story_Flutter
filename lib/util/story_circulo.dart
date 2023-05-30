import 'package:flutter/material.dart';

class StoryCirculo extends StatelessWidget {
  final function;
  const StoryCirculo({super.key, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:function,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          height: 80,
          width: 80,
        ),
      ),
    );
  }
}
