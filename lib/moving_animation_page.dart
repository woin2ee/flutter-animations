import 'dart:math';

import 'package:flutter/material.dart';

enum Position {
  topLeft(top: 50, left: 50),
  topRight(top: 50, left: 200),
  bottomLeft(top: 200, left: 50),
  bottomRight(top: 200, left: 200);

  const Position({required this.top, required this.left});

  final double top;
  final double left;
}

class MovingAnimationPage extends StatefulWidget {
  const MovingAnimationPage({super.key, required this.title});

  final String title;

  @override
  State<MovingAnimationPage> createState() => _MovingAnimationPageState();
}

class _MovingAnimationPageState extends State<MovingAnimationPage> {
  Position position = Position.topLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.fastEaseInToSlowEaseOut,
            top: position.top,
            left: position.left,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                final random = Random();
                int randomIndex;
                Position randomPosition;
                do {
                  randomIndex = random.nextInt(Position.values.length);
                  randomPosition = Position.values[randomIndex];
                } while (randomPosition == position);
                setState(() {
                  position = randomPosition;
                });
              },
              child: Container(
                color: Colors.blue.shade200,
                child: const SizedBox.square(dimension: 120),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
