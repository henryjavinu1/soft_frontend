// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                ),
                const SizedBox(height: 3),
                const Text(
                  "Por favor ingrese su usuario y contraseña para conocer su identidad.",
                  style: TextStyle(fontSize: 15, color: Color(0xff606060)),
                ),
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
                                    onPressed: () => login(),
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
      }));

  Future<void> login() async {
    if (usuarioController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://localhost:8080/api/user/login"),
          body: ({
            'username': usuarioController.text,
            'password': passwordController.text
          }));
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, 'pantalla_principal',
            arguments: response.body);
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Contraseña Incorrecta")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Datos Incorrectos")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Campos en blanco")));
    }
  }
}
