import 'package:flutter/material.dart';

class ScaleAnimationPage extends StatefulWidget {
  const ScaleAnimationPage({super.key, required this.title});

  final String title;

  @override
  State<ScaleAnimationPage> createState() => _ScaleAnimationPageState();
}

class _ScaleAnimationPageState extends State<ScaleAnimationPage> {
  bool isLarge = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.pink.shade300,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                isLarge = !isLarge;
              });
            },
            child: AnimatedSize(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: SizedBox.square(
                dimension: isLarge ? 200 : 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
