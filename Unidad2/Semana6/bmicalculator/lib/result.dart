import 'dart:math';
import 'package:bmicalculator/interface.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final double bmi;
  final String category;
  const Result({required this.bmi, required this.category, super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  // descriptions map for each BMI category
  static const Map<String, List<String>> descripcionesIMC = {
    "bajo_peso": [
      "Presenta un peso corporal por debajo del rango recomendado.",
      "Su índice de masa corporal se encuentra por debajo del nivel saludable.",
      "Tiene una masa corporal inferior a la esperada para su estatura.",
      "Se observa un peso menor al estándar recomendado.",
      "Su evaluación indica insuficiencia de peso corporal.",
      "Registra un peso por debajo del promedio saludable.",
      "Presenta delgadez por debajo del rango normal.",
      "Su composición corporal indica bajo peso.",
      "Tiene un peso inferior al ideal para su estatura.",
      "Se encuentra por debajo del rango adecuado de masa corporal."
    ],

    "normal": [
      "Su peso se encuentra dentro del rango saludable.",
      "Presenta un índice de masa corporal adecuado.",
      "Tiene un peso acorde a su estatura.",
      "Se mantiene dentro de los parámetros saludables.",
      "Su composición corporal es considerada normal.",
      "Registra un peso equilibrado.",
      "Presenta un estado corporal saludable.",
      "Su evaluación indica peso adecuado.",
      "Se encuentra dentro del rango ideal.",
      "Mantiene una proporción saludable entre peso y estatura."
    ],

    "sobrepeso": [
      "Presenta un peso corporal por encima del rango recomendado.",
      "Tiene un índice de masa corporal superior a los valores saludables.",
      "Muestra acumulación de grasa corporal mayor a la recomendada.",
      "Su peso excede el promedio esperado para su estatura.",
      "Se encuentra por encima del rango saludable.",
      "Presenta exceso de peso corporal.",
      "Tiene masa corporal elevada.",
      "Su composición corporal indica sobrepeso.",
      "Registra un peso mayor al sugerido médicamente.",
      "Presenta un desequilibrio entre estatura y peso."
    ],

    "obesidad": [
      "Presenta un nivel de obesidad según su índice de masa corporal.",
      "Su evaluación indica obesidad.",
      "Tiene un exceso significativo de masa corporal.",
      "Registra un IMC en rango de obesidad.",
      "Presenta acumulación elevada de grasa corporal.",
      "Se encuentra en un rango que requiere atención médica.",
      "Su peso supera considerablemente el rango saludable.",
      "Presenta obesidad según criterios clínicos.",
      "Tiene una masa corporal muy superior al ideal.",
      "Su condición corresponde a obesidad."
    ],
  };

  Color _colorForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'bajo peso':
        return Colors.yellow;
      case 'normal':
        return Colors.green;
      case 'sobrepeso':
        return Colors.orange;
      case 'obesidad':
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  String _descriptionForCategory(String category) {
    // normalize and convert to map key style (underscores, lower)
    String key = category.toLowerCase().replaceAll(' ', '_');
    List<String>? options = descripcionesIMC[key];
    if (options == null || options.isEmpty) return '';
    final rnd = Random();
    return options[rnd.nextInt(options.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              "BMI is",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 47, 42, 42),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      widget.category.toUpperCase(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: _colorForCategory(widget.category),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.bmi.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        _descriptionForCategory(widget.category),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _colorForCategory(widget.category)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const Interface()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red, // Fondo rojo
                foregroundColor: Colors.white, // Color del texto
                padding: const EdgeInsets.only(
                  left: 90,
                  right: 90,
                  top: 30,
                  bottom: 30,
                ), // Padding interno
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius
                      .zero, // Hace el botón cuadrado (sin bordes redondeados)
                ),
              ),
              child: const Text(
                'RECALCULATE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
