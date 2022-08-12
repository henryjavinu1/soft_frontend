import 'package:flutter/material.dart';

import '../models/crearFactura.model.dart';
import '../services/generarFactura.service.dart';

Future<Factura?> crearFactura_Controller(
    String idVenta, String idTipoPago, context) async {
  if (idVenta.isNotEmpty && idTipoPago.isNotEmpty) {
    final factura = await crearFactura(idVenta, idTipoPago, context);
    if (factura != null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Factura añadido con exito")));
      return factura;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No se pudo agregar la factura")));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Campos en blanco")));
  }
}
