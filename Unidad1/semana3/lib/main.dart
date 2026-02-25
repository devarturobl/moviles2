import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const BallPage());
}

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Ask Me Anything', style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromARGB(255, 3, 34, 89),
        ),
        body: Ball()
        )
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            ballNumber = Random().nextInt(5) + 1;
            print("I got clicked $ballNumber");
          });
        },
        child: Image.asset('images/ball$ballNumber.png')
      ),
    );
  }
}
