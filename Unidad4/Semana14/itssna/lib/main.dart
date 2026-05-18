import 'package:flutter/material.dart';
import 'package:itssna/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITSSNA MOVIL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 11, 43, 94), // Azul Institucional
          primary: const Color.fromARGB(255, 9, 31, 68),
          secondary: const Color(0xFF807E82), // Gris Institucional
          surface: Colors.white,
        ),
        
        // Estilo de la AppBar (Barra superior) siguiendo el look limpio del manual
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 11, 43, 94),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
      fontFamily: 'NotoSans',
      ),
      home: HomePage(),
    );
  }
}

