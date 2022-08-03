import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/models.dart';

import '../constans.dart';
import '../models/crearFactura.model.dart';

Future<void> crearFactunhra(String idVenta, String idTipoPago, context) async {
  if (idVenta.isNotEmpty && idTipoPago.isNotEmpty) {
    var response = await http.post(Uri.parse(API_URL + "gene/insertfact"),
        body: ({
          'idVenta': idVenta,
          'idTipoPago': idTipoPago,
        }));
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Factura Creado")));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al crear un Factura")));
  }
}

Future<List<Factura?>> crearFactura(
    String idVenta, String idTipoPago, context) async {
  var fact = http.Client();
  Factura? factura = null;
  List<Factura?> facturaCreada = [];
  try {
    var response = await http.post(Uri.parse(API_URL + "gene/insertfact"),
        body: ({
          'idVenta': idVenta,
          'idTipoPago': idTipoPago,
        }));
    if (response.statusCode == 200) {
      final Facturaa = json.decode(response.body);
      print(Facturaa);
    } else {}
    return facturaCreada;
  } catch (e) {
    return facturaCreada;
  } finally {
    http.Client().close();
  }
}
