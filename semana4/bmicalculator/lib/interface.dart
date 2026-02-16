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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Area1
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: MyConteiner()),
                Expanded(child: MyConteiner()),
              ],
            ),
          ),
          //Area2
          Expanded(child: MyConteiner()),
          //Area3
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: MyConteiner()),
                Expanded(child: MyConteiner()),
              ],
            ),
          ),
          //Area4
          Expanded(child: MyConteiner())
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
                  color: const Color.fromARGB(255, 47, 42, 42),
                ),
              );
  }
}