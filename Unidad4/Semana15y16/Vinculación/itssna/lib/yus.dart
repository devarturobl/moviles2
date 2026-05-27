import 'package:flutter/material.dart';

class Yus extends StatefulWidget {
  const Yus({super.key});

  @override
  State<Yus> createState() => _YusState();
}

class _YusState extends State<Yus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi Barra"),
      ),
      body: Center(child: Text("Hola Yus"),),
    );
  }
}