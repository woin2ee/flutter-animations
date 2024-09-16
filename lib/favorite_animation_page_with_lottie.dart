import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FavoriteAnimationPageWithLottie extends StatefulWidget {
  const FavoriteAnimationPageWithLottie({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _FavoriteAnimationPageWithLottieState();
}

class _FavoriteAnimationPageWithLottieState extends State<FavoriteAnimationPageWithLottie>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  bool favorite = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double buttonSize = 40;
    const double iconSize = 28;
    const double lottieScale = 3.5;
    const double adjustedLottieSize = iconSize * lottieScale;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              setState(() {
                favorite = !favorite;
              });
            },
            icon: favorite
                ? OverflowBox(
                    maxWidth: adjustedLottieSize,
                    maxHeight: adjustedLottieSize,
                    child: Lottie.asset(
                      'assets/lotties/favorite_enabled.json',
                      controller: controller,
                      onLoaded: (LottieComposition composition) {
                        controller
                          ..value = 0
                          ..duration = const Duration(milliseconds: 800)
                          ..forward();
                      },
                      renderCache: null,
                    ),
                  )
                : const Icon(
                    Icons.favorite_border_rounded,
                    size: iconSize,
                  ),
          ),
        ),
      ),
    );
  }
}
