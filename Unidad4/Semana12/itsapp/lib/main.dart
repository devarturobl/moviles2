import 'package:flutter/material.dart';

void main() {
  runApp(const ItsApp());
}

class ItsApp extends StatelessWidget {
  const ItsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ITSSNA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B6E4F)),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //encabezado
            Container(
              height: 200,
              decoration: BoxDecoration(
                color:  Color.fromARGB(255, 132, 12, 4),
                borderRadius:  BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ITSSNA", style: TextStyle(color: Colors.white, fontSize: 50),),
                    Text("AVISOS", style: TextStyle(color: Colors.white, fontSize: 30),)
                  ],
                ),
              ),
            )
        
            //notificaciones
        
            //aviso
        
            //recursos
          ],
        ),
      )
    );
  }
}

