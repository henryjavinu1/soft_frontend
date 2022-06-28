import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
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
                      Text("Iniciar Sesión"),
                      TextField(
                          decoration: InputDecoration(labelText: "Usuario")),
                      TextField(
                          obscureText: true,
                          decoration: InputDecoration(labelText: "Password")),
                      RaisedButton(
                          color: Colors.blue,
                          child: Text("Iniciar",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {})
                    ]),
              ),
            ));
      }));
}
