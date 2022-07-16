import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/constans.dart';

//ignore: non_constant_identifier_names
Future<void> ActualizarArqueoCerrandoSesion(
    String idUsuario, String idSesion, String idArqueo, context) async {
  if (idUsuario.isNotEmpty && idSesion.isNotEmpty && idArqueo.isNotEmpty) {
    var response = await http.post(
        Uri.parse(API_URL + 'arqueo/actualizacionCerrandoSesion'),
        body: ({
          'idUsuario': idUsuario,
          'idSesion': idSesion,
          'idArqueo': idArqueo,
        }));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Arqueo Actualizado")));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al actualizar Arqueo")));
  }
}
