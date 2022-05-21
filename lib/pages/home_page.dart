// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catlog App"),
      ),
      body: Center(
        child: Container(
            child: Text(
          "Hello world",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        )),
      ),
      drawer: Drawer(),
    );
  }
}
