import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> crearRol(String rol, String descripcion, context) async {
  if (rol.isNotEmpty && descripcion.isNotEmpty) {
    var response = await http.post(
        Uri.parse("http://localhost:8080/api/permiso/crearol"),
        body: ({'rol': rol, 'descripcion': descripcion}));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("rol Creado")));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Error al crear rol")));
  }
}
