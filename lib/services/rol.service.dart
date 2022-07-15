import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import '../models/rol.model.dart';
import 'package:soft_frontend/constans.dart';

Future<Rol?> crearRol(String rol, String descripcion) async {
  var client = http.Client();
  Rol? rol = null;
  try {
    var response = await client.post(Uri.parse(API_URL + "roles/crearol"),
        body: {'rol': rol, 'descripcion': descripcion});

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("rol Creado")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error al crear rol")));
    }
  } finally {
    client.close();
  }
}
