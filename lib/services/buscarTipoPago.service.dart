import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/tipoPagoBuscado.model.dart';
import 'package:soft_frontend/models/manipularTipoPago.dart';
import 'package:soft_frontend/models/unPagoBuscado.model.dart';

// ignore: non_constant_identifier_names

Future<List<TipoPagoBuscado>> traerPago() async {
  List<TipoPagoBuscado> PagoVacio = [];
  try {
    var response = await http
        .get(Uri.parse("http://localhost:8080/api/gene/buscartipopago"));
    if (response.statusCode == 200) {
      final tipopagos = manipularTipoPagoFromJson(response.body);
      return tipopagos.tipoPago;
    } else {
      return PagoVacio;
    }
  } catch (e) {
    return PagoVacio;
  }
}

Future<TipoPagoBuscado?> buscarPagoPorID(String idTipoPago) async {
  TipoPagoBuscado? tipoPago = null;
  try {
    var response = await http.post(
        Uri.parse("http://localhost:8080/api/gene/buscartipopagoid"),
        body: ({
          'idTipoPago': idTipoPago,
        }));
    print(response.body.toString());
    if (response.statusCode == 200) {
      final tipopagos = tipoPagoBuscadoFromJson(response.body);
      return tipopagos;
    } else {
      return tipoPago;
    }
  } catch (e) {
    return tipoPago;
  }
}
