import 'dart:convert';
import 'dart:js_util';
import 'package:flutter/material.dart';
import '../models/ventas.model.dart';
import '../services/ventas.service.dart';

Future<Ventas?> crearVenta_Controller(
    double totalIsv,
    double totalVenta,
    double totalDescuentoVenta,
    String puntoDeEmision,
    String establecimiento,
    String tipo,
    int idSesion,
    int idUsuario,
    int idCliente,
    context) async {
  if (totalIsv.toString().isNotEmpty &&
      totalVenta.toString().isNotEmpty &&
      totalDescuentoVenta.toString().isNotEmpty &&
      puntoDeEmision.isNotEmpty &&
      establecimiento.isNotEmpty &&
      tipo.isNotEmpty &&
      idSesion.toString().isNotEmpty &&
      idUsuario.toString().isNotEmpty &&
      idCliente.toString().isNotEmpty ) {
    List<Ventas?> ventas = await crearVenta(
        totalIsv, totalVenta, totalDescuentoVenta, puntoDeEmision, establecimiento, tipo, idSesion, idUsuario,idCliente);
    if (ventas != null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Venta añadida con exito")));
    } else {
      
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Campos en blanco")));
  }
}