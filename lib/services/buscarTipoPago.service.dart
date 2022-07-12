import 'dart:convert';
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

Future buscarPagoPorID(String idTipoPago) async {
  try {
    var response = await http
        .get(Uri.parse("http://localhost:8080/api/gene/buscartipopagoid"));
    if (response.statusCode == 200) {
      final tipopagos = UnTipoPagoBuscadoFromJson(response.body);
      return tipopagos;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
