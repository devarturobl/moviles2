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
    switch (category.toLowerCase()) {
      case 'bajo peso':
        return 'Tu IMC indica bajo peso. Considera una dieta nutritiva y consulta con un profesional de la salud.';
      case 'normal':
        return 'Tu peso corporal es normal. ¡Sigue con el buen trabajo!';
      case 'sobrepeso':
        return 'Tienes un peso corporal superior al normal. Intenta hacer más ejercicio y llevar una dieta equilibrada.';
      case 'obesidad':
        return 'Tu IMC se encuentra en el rango de obesidad. Se recomienda consultar a un médico y revisar tu estilo de vida.';
      default:
        return '';
    }
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
