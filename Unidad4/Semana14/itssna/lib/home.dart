import 'package:flutter/material.dart';
import 'package:itssna/yus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ITSSNA AJALPAN'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('¡Listo para diseñar la UX/UI!'),
            TextButton(onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const Yus(),
                ),
              );
            },
           child: Text("Preciona"))
          ],
        ),
      ),
    );
  }
}
