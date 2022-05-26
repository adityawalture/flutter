// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.lightBlue[200],
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text(
                  "Aditya",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text("aditya1234@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/loki.jpg'),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Icon(
                  CupertinoIcons.home,
                  color: Colors.black,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.fromLTRB(1, 4, 20, 0),
                child: Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Icon(
                  CupertinoIcons.wifi,
                  color: Colors.black,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.fromLTRB(1, 4, 20, 0),
                child: Text(
                  "Network",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Icon(
                  CupertinoIcons.mail,
                  color: Colors.black,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.fromLTRB(1, 4, 20, 0),
                child: Text(
                  "Mail",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
