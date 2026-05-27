import 'package:flutter/material.dart';
import 'package:notification/homepage.dart';
import 'package:notification/noti_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotiService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Homepage(),
    );
  }
}

