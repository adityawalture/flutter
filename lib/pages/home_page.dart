// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:catalog_2/models/catlog.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dumyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Catlog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0.0),
        child: ListView.builder(
          itemCount: dumyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              items: dumyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
