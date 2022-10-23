import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = ConfettiController();
  bool isPlaying = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text('CONFETTI'),
            centerTitle: true,
          ),
          body: Center(
            child: MaterialButton(
              onPressed: () {
                if (isPlaying) {
                  _controller.stop();
                } else {
                  _controller.play();
                }
                isPlaying = !isPlaying;
              },
              child: Text('Party Time'),
              color: Colors.deepPurple[200],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _controller,
          blastDirection: pi / 2,
          colors: [
            Colors.deepPurple,
            Colors.yellow,
          ],
          gravity: 0.01,
        ),
      ],
    );
  }
}
