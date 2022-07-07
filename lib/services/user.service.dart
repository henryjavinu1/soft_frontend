import 'dart:convert';
import 'dart:developer';
import '../models/user.model.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/constans.dart';

Future<Usuario?> login(String email, String passwd) async {
  var client = http.Client();
  Usuario? user = null;
  try {
    var response = await client.post(Uri.parse(API_URL + "user/login"),
        body: {'username': email, 'password': passwd});
    if (response.statusCode == 200) {
      Usuario user = Usuario.fromJson(json.decode(response.body));
      log(user.toString());
      return user;
    } else {
      return user;
    }
  } finally {
    client.close();
  }
}
