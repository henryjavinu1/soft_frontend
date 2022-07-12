import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> crearPermiso(String permiso, String descripcion, context) async {
  if (permiso.isNotEmpty && descripcion.isNotEmpty) {
    var response = await http.post(
        Uri.parse("http://localhost:8080/api/permiso/crearpermiso"),
        body: ({'permiso': permiso, 'descripcion': descripcion}));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Permiso Creado")));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Error al crear Permiso")));
  }
}
