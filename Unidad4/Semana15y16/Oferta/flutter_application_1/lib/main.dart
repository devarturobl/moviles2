import 'package:flutter/material.dart';
// IMPORTANTE: Asegúrate de que el nombre del archivo sea exactamente este
import 'screens/oferta_educativa.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ITSSNA App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A237E)),
        useMaterial3: true,
      ),
      // Aquí llamamos a la página que está en el otro archivo
      home: const OfertaEducativaPage(),
    );
  }
}