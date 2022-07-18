import 'dart:convert';
import 'dart:developer';
import '../models/user.model.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/constans.dart';

Future<User?> logins(String username, String passwd) async {
  var client = http.Client();
  User? user = null;
  try {
    var response = await client.post(Uri.parse(API_URL + "user/login"),
        body: {'username': username, 'password': passwd});
    if (response.statusCode == 200) {
      User user = User.fromJson(response.body);
      log(user.toString());
      return user;
    } else {
      return user;
    }
  } finally {
    client.close();
  }
}

Future<User?> crearUser(
    String usuario, String pass, String email, context) async {
  var client = http.Client();
  User? usurio = null;
  try {
    var response = await client.post(Uri.parse(API_URL + "user/crearuser"),
        body: {'user': usuario, 'password': pass, 'email': email});

    if (response.statusCode == 200) {
      User usuario = User.fromJson(json.decode(response.body));
      log(usuario.toString());
      return usuario;
    } else {
      return usurio;
    }
  } finally {
    client.close();
  }
}
