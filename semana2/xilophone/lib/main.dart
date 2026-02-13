import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: (){
                    final player = AudioPlayer();
                    player.play(AssetSource('note1.wav'));
                  }, 
                  child: Text('Click me')),
                  ElevatedButton(
                  onPressed: (){
                    final player = AudioPlayer();
                    player.play(AssetSource('note2.wav'));
                  }, 
                  child: Text('Click me')),
              ],
            )
            ),
          ),
        ),
      );
  }
}