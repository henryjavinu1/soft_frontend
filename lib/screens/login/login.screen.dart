import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

enum Gender {
  Email,
  password,
}

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Colors.lightGreen[200],
            padding: constraints.maxWidth < 500
                ? EdgeInsets.zero
                : const EdgeInsets.all(30.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 25.0),
                constraints: BoxConstraints(
                  maxWidth: 500,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Login"),
                      TextField(
                          decoration: InputDecoration(labelText: "User")),
                      TextField(
                          obscureText: true,
                          decoration: InputDecoration(labelText: "Password")),
                      RaisedButton(
                          color: Colors.blue,
                          child: Text("Log In",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {})
                    ]),
              ),
            ));
      }));
}
