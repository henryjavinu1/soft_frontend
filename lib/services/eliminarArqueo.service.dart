import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/constans.dart';

// ignore: non_constant_identifier_names
Future<void> EliminarArqueo(String idArqueo, context) async {
  var response = await http.post(Uri.parse(API_URL + 'arqueo/deleteArqueo'),
      body: ({
        'idArqueo': idArqueo,
      }));

  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Arqueo Eliminado")));
  }
}
