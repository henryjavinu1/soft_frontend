import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soft_frontend/screens/login/login.screen.dart';
import 'package:soft_frontend/screens/pantallaPrincipal/principal.screen.dart';
import 'package:soft_frontend/services/login.service.dart';

import '../models/user.model.dart';
import '../services/user.service.dart';

Future<bool> login_controller(String usuario, String passwd, context) async {
  if (usuario.isNotEmpty && passwd.isNotEmpty) {
    User? user = await login(usuario, passwd);
    final prefs = await SharedPreferences.getInstance();
    if (user != null) {
      Navigator.pushNamed(context, "pantalla_principal");
      await prefs.setBool('logeado', true);
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error al iniciar Sesion")));
      await prefs.setBool('logeado', false);
      return false;
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("LLenar todos lo campos")));
    return false;
  }
}

Future<bool> logout_controller(context) async {
  bool? user = await logout();
  if (user != null) {
    final prefs = await SharedPreferences.getInstance();
    final nologin = await prefs.remove('logeado');
    Navigator.pushNamed(context, "login");
    return true;
  } else {
    return false;
  }
}

Future<User> usercontroller() async {
  final prefs = await SharedPreferences.getInstance();
  final String? user = prefs.getString('response');
  User userfinal = User.fromJson(user!);
  return userfinal;
}

Future<bool?> logeado() async {
  final prefs = await SharedPreferences.getInstance();
  final bool? logeado = prefs.getBool('logeado');
  if (logeado == true) {
    return true;
  } else {
    return null;
  }
}

Future<bool> crearUser_Controller(
    String usuario, String password, String email, context) async {
  User? user = await crearUser(usuario, password, email, context);
  if (user != null) {
    return true;
  } else {
    return false;
  }
}
