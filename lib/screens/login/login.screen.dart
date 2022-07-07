import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:soft_frontend/controllers/user.controller.dart";

import '../home/home.screen.dart';

enum Gender {
  Email,
  password,
}

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: Colors.lightGreen[200],
            padding: constraints.maxWidth < 500
                ? EdgeInsets.zero
                : const EdgeInsets.all(30.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 25.0),
                constraints: const BoxConstraints(
                  maxWidth: 500,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Iniciar Sesión"),
                      TextField(
                          controller: emailController,
                          decoration:
                              const InputDecoration(labelText: "Usuario")),
                      TextField(
                          controller: passController,
                          obscureText: true,
                          decoration:
                              const InputDecoration(labelText: "Password")),
                      RaisedButton(
                          color: Colors.blue,
                          child: const Text("Iniciar",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () async {
                            bool resp = await login_controller(
                                emailController.text, passController.text);
                            if (resp) {
                              Fluttertoast.showToast(
                                  msg: "Bienvenido",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()));
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Usuario Incorrecto",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          })
                    ]),
              ),
            ));
      }));
}
