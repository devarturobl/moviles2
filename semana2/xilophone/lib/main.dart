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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                botonS(color: Colors.red, sound: 'note1.wav'),
                botonS(color: Colors.orange, sound: 'note2.wav'),
                botonS(color: Colors.yellow, sound: 'note3.wav'),
                botonS(color: Colors.green, sound: 'note4.wav'),
                botonS(color: Colors.blue, sound: 'note5.wav'),
                botonS(color: Colors.indigo, sound: 'note6.wav'),
                botonS(color: Colors.purple, sound: 'note7.wav'),
              ],
            )
            ),
          ),
        ),
      );
  }
}


class botonS extends StatelessWidget {
  final Color color;
  final String sound;
  const botonS({required this.color, required this.sound, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        minimumSize: const Size(200, 60),
        elevation: 10,
        shadowColor: color.withOpacity(0.5),
      ),
      onPressed: (){
        final player = AudioPlayer();
        player.play(AssetSource(sound));
      }, 
      child: Text('Click me')
    );
  }
}