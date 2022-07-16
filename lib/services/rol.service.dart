import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import '../models/rol.model.dart';
import 'package:soft_frontend/constans.dart';

Future<Rol?> crearRol(String rol, String descripcion) async {
  var client = http.Client();
  Rol? role = null;
  try {
    var response = await client.post(Uri.parse(API_URL + "roles/create"),
        body: {'rol': rol, 'descripcion': descripcion});

    if (response.statusCode == 200) {
      Rol role = Rol.fromJson(json.decode(response.body));
      log(role.toString());
      return role;
    } else {
      return role;
    }
  } finally {
    client.close();
  }
}
