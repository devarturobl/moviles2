import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Flutter Demo Home Page';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hola"),
            Text("Ajalpan", 
            style: TextStyle(
              color: Colors.amberAccent,
              fontSize: 44, 
              fontWeight:FontWeight.bold)
              ),
          ],
        )),
      )
    );
  }
}