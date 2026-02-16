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
                Expanded(child: MyConteiner(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.male),
                    Text("Male")
                  ]
                ),)),
                Expanded(child: MyConteiner(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.female),
                    Text("Female")
                  ]
                ),)),
              ],
            ),
          ),
          //Area2
          Expanded(child: MyConteiner(child: null,)),
          //Area3
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: MyConteiner(child: null,)),
                Expanded(child: MyConteiner(child: null,)),
              ],
            ),
          ),
          //Area4
          Expanded(child: MyConteiner(child: null,))
        ],
      ),
    );
  }
}

class MyConteiner extends StatelessWidget {
  final Widget? child;
  const MyConteiner({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 47, 42, 42),
                ),
                child: child == null ? null : Center(child: child!),
              );
  }
}