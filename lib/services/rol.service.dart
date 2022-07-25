import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import '../models/rol.model.dart';
import 'package:soft_frontend/constans.dart';

Future<List<Rol?>> crearRol(
    String id, String rol, String descripcion, context) async {
  var client = http.Client();
  Rol? role;
  List<Rol?> RolCreado = [];
  try {
    var response = await client.post(Uri.parse(API_URL + "roles/create"),
        body: ({'id': id, 'rol': rol, 'descripcion': descripcion}));
    print(response.body);
    if (response.statusCode == 200) {
      print(Rol);
    } else {}
    return RolCreado;
  } catch (e) {
    return RolCreado;
  } finally {
    client.close();
  }
}
