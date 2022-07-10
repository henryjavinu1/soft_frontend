<<<<<<< HEAD
// ignore_for_file: prefer_const_constructors
=======
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:soft_frontend/controllers/user.controller.dart";

import '../home/home.screen.dart';
>>>>>>> main

import 'package:flutter/material.dart';
import 'package:soft_frontend/services/login.service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
<<<<<<< HEAD
  var usuarioController = TextEditingController();
  var passwordController = TextEditingController();
  bool _password = true;

  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          padding: constraints.maxWidth < 500
              ? const EdgeInsets.all(20)
              : const EdgeInsets.all(30.0),
          color: const Color(0xffF3F3F3),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Iniciar sesión",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
=======
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
>>>>>>> main
                ),
                const SizedBox(height: 3),
                const Text(
                  "Por favor ingrese su usuario y contraseña para conocer su identidad.",
                  style: TextStyle(fontSize: 15, color: Color(0xff606060)),
                ),
<<<<<<< HEAD
                const SizedBox(height: 40),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 500,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Usuario",
                              style: TextStyle(fontSize: 18),
                            ),
                            TextFormField(
                              controller: usuarioController,
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: 'usuario01'),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Contraseña",
                              style: TextStyle(fontSize: 18),
                            ),
                            TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: _password,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.visibility_off_outlined),
                                    onPressed: () {
                                      setState(() {
                                        _password = !_password;
                                      });
                                    },
                                  ),
                                  border: UnderlineInputBorder(),
                                  hintText: 'usuario01'),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextButton(
                              onPressed: null,
                              child: Center(
                                child: ElevatedButton(
                                    onPressed: () => login(usuarioController.text, passwordController.text, context),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Text('Continuar'),
                                    )),
                              ),
                            ),
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      })
      );

=======
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
>>>>>>> main
}
