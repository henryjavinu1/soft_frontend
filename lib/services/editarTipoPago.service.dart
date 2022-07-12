import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: non_constant_identifier_names
Future<void> EditarTipoPago(String idTipoPago, String tipoDePago,
    String descripcionTipoPago, context) async {
  if (tipoDePago.isNotEmpty && descripcionTipoPago.isNotEmpty) {
    var response = await http.post(
        Uri.parse("http://localhost:8080/api/gene/actualizartipopago"),
        body: ({
          'idTipoPago': idTipoPago,
          'tipoDePago': tipoDePago,
          'descripcionTipoPago': descripcionTipoPago,
        }));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Tipo de Pago Actualizado")));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al actualizar TIpo de Pago")));
  }
}
