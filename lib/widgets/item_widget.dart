// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:catalog_2/models/catlog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item items;

  // ignore: unnecessary_null_comparison
  const ItemWidget({Key? key, required this.items})
      : assert(items != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.2,
      shape: StadiumBorder(),
      child: ListTile(
        onTap: () {
          print("${items.name}");
        },
        leading: Image.network(items.imgURL),
        title: Text(
          items.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(items.desc),
        trailing: Text("\$${items.price}"),
        tileColor: Colors.grey[300],
      ),
    );
  }
}
