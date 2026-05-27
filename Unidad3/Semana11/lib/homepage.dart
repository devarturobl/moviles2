import 'package:flutter/material.dart';
import 'package:notification/noti_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: (){
        NotiService().showNotification(
          title: "Titulo",
          body: "Body"
        );
      }, child: Text("Send")),),
    );
  }
}