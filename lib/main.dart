import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(FlappyBirdApp());
}

class FlappyBirdApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlappyBirdGame(),
    );
  }
}

class FlappyBirdGame extends StatefulWidget {
  @override
  _FlappyBirdGameState createState() => _FlappyBirdGameState();
}


class _FlappyBirdGameState extends State<FlappyBirdGame> {
  double birdYAxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = 0;
  bool gameHasStarted = false;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYAxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 60), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYAxis = initialHeight - height;
      });

      if (birdYAxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    gameHasStarted ? "" : "TAP TO START",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: Alignment(0, birdYAxis),
                      duration: const Duration(milliseconds: 0),
                      child: MyBird(),
                    ),
                    Container(
                      alignment: const Alignment(0, 0.9),
                      child: gameHasStarted
                          ? const Text("")
                          : const Text(
                        "TAP TO JUMP",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Image.asset('assets/bird.png'), // Burada 'assets/bird.png' dosyanızın yolunu belirtmelisiniz.
    );
  }
}
