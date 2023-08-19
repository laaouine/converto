import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isWinner = false;

  static var listSymbole = [
    "images/bar.png",
    "images/cerise.png",
    "images/cloche.png",
    "images/diamant.png",
    "images/fer-a-cheval.png",
    "images/pasteque.png",
    "images/sept.png"
  ];

  static var _random01;
  static var _random02;
  static var _random03;
  var imageChossing01;
  var imageChossing02;
  var imageChossing03;
  String message = "..";

  static const Duration _animationDuration = Duration(milliseconds: 500);
  bool _playAnimation = false;

  void _playGame() {
    setState(() {
      _random01 = Random();
      _random02 = Random();
      _random03 = Random();

      imageChossing01 = listSymbole[_random01.nextInt(listSymbole.length)];
      imageChossing02 = listSymbole[_random02.nextInt(listSymbole.length)];
      imageChossing03 = listSymbole[_random03.nextInt(listSymbole.length)];

      if (imageChossing01 == imageChossing02 &&
          imageChossing03 == imageChossing02) {
        message = "jackpot";
        _playAnimation = true;
      } else {
        message = "You Lose... Try Again";
      }
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                    duration:
                        _playAnimation ? _animationDuration : Duration.zero,
                    child: Image.asset(
                      imageChossing01.toString(),
                      height: 50,
                      width: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                    duration:
                        _playAnimation ? _animationDuration : Duration.zero,
                    child: Image.asset(
                      imageChossing02.toString(),
                      height: 50,
                      width: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                    duration:
                        _playAnimation ? _animationDuration : Duration.zero,
                    child: Image.asset(
                      imageChossing03.toString(),
                      height: 50,
                      width: 100,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              message,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playGame,
        tooltip: 'Play',
        child: const Icon(Icons.add),
      ),
    );
  }
}
