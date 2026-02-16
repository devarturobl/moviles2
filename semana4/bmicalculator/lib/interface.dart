import 'package:flutter/material.dart';

class Interface extends StatefulWidget {
  const Interface({super.key});

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  bool isMale = false;
  bool isFemale = false;
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
                Expanded(child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                      isFemale = false;
                    });
                  },
                  child: MyConteiner(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.male, size: 80, color: isMale ? Colors.blue : Colors.white),
                      Text("Male", style: TextStyle(fontWeight: FontWeight.bold),)
                    ]
                  ),),
                )),
                Expanded(child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                      isFemale = true;
                    });
                  },
                  child: MyConteiner(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.female, size: 80, color: isFemale ? Colors.pink : Colors.white,),
                      Text("Female", style: TextStyle(fontWeight: FontWeight.bold))
                    ]
                  ),),
                )),
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
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 47, 42, 42),
                ),
                child: child == null ? null : Center(child: child!),
              );
  }
}