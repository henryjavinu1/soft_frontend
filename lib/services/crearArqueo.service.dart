import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/constans.dart';

// ignore: non_constant_identifier_names
Future<void> CrearArqueo(
    String idSesion, String idUsuario, String efectivoApertura, context) async {
  if (idSesion.isNotEmpty &&
      idUsuario.isNotEmpty &&
      efectivoApertura.isNotEmpty) {
    var response = await http.post(Uri.parse(API_URL + 'arqueo/createArqueo'),
        body: ({
          'idSesion': idSesion,
          'idUsuario': idUsuario,
          'efectivoApertura': efectivoApertura,
        }));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Arqueo Creado")));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Error al crear Arqueo")));
  }
}
