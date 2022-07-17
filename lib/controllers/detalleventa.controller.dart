import 'dart:convert';
import 'dart:js_util';
import 'package:flutter/material.dart';
import '../models/detalleventa.model.dart';
import '../services/detalleventa.service.dart';

Future<DetalleVenta?> crearDetalle_Controller(
    int cantidad,
    double precioUnitario,
    double totalDetalleVenta,
    double isvAplicado,
    double descuentoAplicado,
    int idVentas,
    int idProducto,
    context) async {
  if (cantidad.toString().isNotEmpty &&
      precioUnitario.toString().isNotEmpty &&
      isvAplicado.toString().isNotEmpty &&
      descuentoAplicado.toString().isNotEmpty &&
      totalDetalleVenta.toString().isNotEmpty &&
      idVentas.toString().isNotEmpty &&
      idProducto.toString().isNotEmpty) {
    List<DetalleVenta?> detalleventa = await crearDetalle(cantidad,
        precioUnitario, isvAplicado, descuentoAplicado, totalDetalleVenta, idVentas, idProducto);
    if (detalleventa != null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Detalle Venta añadida con exito")));
    } else {}
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Campos en blanco")));
  }
}
