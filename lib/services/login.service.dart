import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
  Future<void> login(String usuario, String password, context) async {

    SharedPreferences prefs = await  SharedPreferences.getInstance();
    if (usuario.isNotEmpty &&
        password.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://localhost:8080/api/user/login"),
          body: ({
            'username': usuario,
            'password': password
          }));

          
      if (response.statusCode == 200) {
        
        await prefs.setString("response", response.body);
        
        Navigator.pushNamed(context, 'pantalla_principal',);
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Contraseña Incorrecta")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Datos Incorrectos")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Campos en blanco")));
    }
  }