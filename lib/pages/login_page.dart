// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:catalog_2/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/img_2.png",
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 10.0),
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        helperText: "Enter User Name",
                        labelText: "User Name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Give Username";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        helperText: "Enter Password",
                        labelText: "User Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Give Password";
                        } else if (value.length < 6) {
                          return "Password should have more then 6 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      // ignore: sort_child_properties_last
                      child: Text("Login"),
                      style: TextButton.styleFrom(maximumSize: Size(150, 40)),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                    ),
                    InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: 100,
                        height: 40,
                        alignment: Alignment.center,
                        // ignore: sort_child_properties_last
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.deepOrangeAccent,
                              )
                            : Text(
                                "Next Page",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                        decoration: BoxDecoration(
                          color:
                              changeButton ? Colors.amber : Colors.indigo[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
