import 'package:animations/favorite_animation_page_with_lottie.dart';
import 'package:animations/moving_animation_page.dart';
import 'package:animations/scale_animation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(title: 'Animations'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<(String, Route Function())> routeList = [
    (
      'Scale Animation',
      () => CupertinoPageRoute(
            builder: (context) => const ScaleAnimationPage(title: 'Scale Animation'),
          )
    ),
    (
      'Moving Animation',
      () => CupertinoPageRoute(
            builder: (context) => const MovingAnimationPage(title: 'Moving Animation'),
          )
    ),
    (
      'Favorite Animation With Lottie',
      () => CupertinoPageRoute(
            builder: (context) => const FavoriteAnimationPageWithLottie(title: 'Favorite Animation With Lottie'),
          )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: routeList.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(routeList[index].$1),
            onTap: () {
              Navigator.of(context).push(routeList[index].$2());
            },
          );
        },
      ),
    );
  }
}
