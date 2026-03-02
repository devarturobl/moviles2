import 'package:bmicalculator/result.dart';
import 'package:flutter/material.dart';

class Interface extends StatefulWidget {
  const Interface({super.key});

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  bool isMale = true;
  bool isFemale = false;
  double height = 100;
  double height2 = 0;
  int peso = 0;
  int edad = 18;
  double bmi = 0;
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
                min: 0,
                max: 250,
                label: height.toInt().toString(),
                divisions: 250,
                activeColor: isMale ? Colors.blue : Colors.pink,
                inactiveColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    height = value;
                    if (height >= 100){
                      peso = height.toInt() - 100;
                    } 
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
                Expanded(child: MyConteiner(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('WEIGHT', style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(peso.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                        const Text('kg', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: isMale ? Colors.blue : Colors.pink,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if(peso >= 0) peso++;
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: isMale ? Colors.blue : Colors.pink,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if(peso > 0) peso--;
                              });
                            },
                            icon: const Icon(Icons.remove),
                          ),
                        ),
                      ],
                    )
                  ],
                ),)),
                Expanded(child: MyConteiner(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('AGE', style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(edad.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                        const Text('years', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: isMale ? Colors.blue : Colors.pink,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if(edad >= 0) edad++;
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: isMale ? Colors.blue : Colors.pink,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if(edad > 0) edad--;
                              });
                            },
                            icon: const Icon(Icons.remove),
                          ),
                        ),
                      ],
                    )
                  ],
                ),)),
              ],
            ),
          ),
          //Area4
          Expanded(child: MyConteiner(
            child: TextButton(
            onPressed: () {
              height2 = height / 100;
              bmi = peso / (height2 * height2);

              // determine category based on BMI
              String category;
              if (bmi < 18.5) {
                category = 'Bajo peso';
              } else if (bmi < 25) {
                category = 'Normal';
              } else if (bmi < 30) {
                category = 'Sobrepeso';
              } else {
                category = 'Obesidad';
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(bmi: bmi, category: category),
                ),
              );
            },
              style: TextButton.styleFrom(
              backgroundColor: Colors.red,        // Fondo rojo
              foregroundColor: Colors.white,      // Color del texto
              padding: const EdgeInsets.only(left: 100, right: 100, top: 30, bottom: 30),  // Padding interno
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,  // Hace el botón cuadrado (sin bordes redondeados)
              ),
            ),
            child: const Text(
              'CALCULATE',
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                ),
              ),
            )
            )
          )
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