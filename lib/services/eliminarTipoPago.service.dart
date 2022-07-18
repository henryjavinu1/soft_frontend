import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: non_constant_identifier_names
Future<void> EliminarTipoPago(String idTipoPago, context) async {
  var response = await http.post(
      Uri.parse("http://localhost:8080/api/gene/eliminartipopago"),
      body: ({
        'idTipoPago': idTipoPago,
      }));

  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Tipo de Pago Eliminado")));
  }
}
