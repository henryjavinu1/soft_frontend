import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> createArqueo(
    String idUsuario, String idSesion, String efectivoApertura, context) async {
  if (idUsuario.toString().isNotEmpty &&
      idSesion.toString().isNotEmpty &&
      efectivoApertura.toString().isNotEmpty) {
    var response = await http.post(
        Uri.parse("http://localhost:8080/api/arqueo/createArqueo"),
        body: ({
          'idUsuario': idUsuario,
          'idSesion': idSesion,
          'efectivoApertura': efectivoApertura
        }));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Arqueo Creado")));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al crear un arqueo")));
  }
}
