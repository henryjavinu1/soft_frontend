import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/tipoPagoBuscado.model.dart';
import 'package:soft_frontend/models/manipularTipoPago.dart';
import 'package:soft_frontend/models/unPagoBuscado.model.dart';
import '../constans.dart';

Future<List<Tipopago?>> CrearTipoPago(
    String tipoDePago, String descripcionTipoPago, context) async {
  var tipopag = http.Client();
  Tipopago? tipopago = null;
  List<Tipopago?> tipopagoCreado = [];
  try {
    var response = await http.post(Uri.parse(API_URL + "gene/insertartipopago"),
        body: ({
          'tipoDePago': tipoDePago,
          'descripcionTipoPago': descripcionTipoPago,
        }));
    print(response.body);
    if (response.statusCode == 200) {
      print(Tipopago);
    } else {}
    return tipopagoCreado;
  } catch (e) {
    return tipopagoCreado;
  } finally {
    http.Client().close();
  }
}

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

Future traerPago() async {
  try {
    var response = await http
        .get(Uri.parse(API_URL + 'gene/buscartipopago'))
        .timeout(Duration(seconds: 15));

    if (response.statusCode == 200) {
      final tipopagos = manipularTipoPagoFromJson(response.body);
      return tipopagos.tipoPago;
    } else if (response.statusCode == 500) {
      return 500;
    }
  } on TimeoutException catch (_) {
    throw ('Tiempo de espera alcanzado');
  } catch (e) {
    print(e);
    return 2;
  }
}
