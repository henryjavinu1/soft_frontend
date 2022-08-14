import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';

import '../constans.dart';
import '../models/crearFactura.model.dart';
import '../screens/manipularFactura/manipularfactura.screen.dart';
import '../services/generarFactura.service.dart';
import '../services/sharepreference.service.dart';

Future paToken(BuildContext context) async {
  final token = await getToken().catchError((error) {
    return '';
  });
  if (token != '') {
    return token;
  } else {
    Navigator.pushReplacementNamed(context, 'login');
    const snackBar = SnackBar(
      content: Text('Por favor inicie sesión para acceder al sistema.'),
      backgroundColor: Colors.red,
    );
    snackbarKey.currentState?.showSnackBar(snackBar);
  }
}

Future<Factura?> crearFactura_Controller(
    String idVenta, String idTipoPago, context) async {
  final token = await paToken(context);
  if (token != '') {
    if (idVenta.isNotEmpty && idTipoPago.isNotEmpty) {
      List<Factura?> factura =
          await crearFactura(idVenta, idTipoPago, token, context);
      if (factura != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Factura añadido con exito")));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ManipularFactura(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No se pudo agregar la factura")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text("Campos en blanco Por favor seleccione un tipo de pago")));
    }
  }
}
