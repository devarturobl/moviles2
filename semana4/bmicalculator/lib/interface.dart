import 'package:flutter/material.dart';

class Interface extends StatefulWidget {
  const Interface({super.key});

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  bool isMale = false;
  bool isFemale = false;
  double height = 0;
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
          Expanded(child: MyConteiner(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('HEIGHT', style: const TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(height.toInt().toString(), style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const Text('cm', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                ],
              ),
              Slider(
                value: height,
                label: height.toInt().toString(),
                min: 0,
                max: 250,
                activeColor: Colors.red,
                inactiveColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
              ),
            ],
          ),)),
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