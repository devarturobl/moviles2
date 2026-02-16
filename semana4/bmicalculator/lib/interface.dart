import 'package:flutter/material.dart';

class Interface extends StatefulWidget {
  const Interface({super.key});

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          //Area1
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: MyConteiner()),
              Expanded(child: MyConteiner()),
            ],
          )
          //Area2
          //Area3
          //Area4
        ],
      ),
    );
  }
}

class MyConteiner extends StatefulWidget {
  const MyConteiner({super.key});

  @override
  State<MyConteiner> createState() => _MyConteinerState();
}

class _MyConteinerState extends State<MyConteiner> {
  @override
  Widget build(BuildContext context) {
    return Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 46, 45, 45),
                ),
                height: 100,
                width: 100,
              );
  }
}