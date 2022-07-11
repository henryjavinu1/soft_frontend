import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/facturaBuscada.model.dart';
import 'package:soft_frontend/models/manipularFacturaResponse.dart';
import 'package:soft_frontend/models/unaFacturaBuscada.model.dart';

// ignore: non_constant_identifier_names

Future<List<FacturaBuscada>> traerFactura() async {
  List<FacturaBuscada> facturaVacia = [];
  try {
    var response = await http.get(Uri.parse("http://localhost:8080/api/traerFacturas"));
    if (response.statusCode == 200) {
      // print(response.request);
      // print(jsonDecode(response.body));
      // print(response.statusCode);
      
      final facturas = manipularFacturaResponseFromJson(response.body);
      // print(facturas.facturas);
      return facturas.facturas;
    }else { 
      // print(response.statusCode);
      return facturaVacia;
    }
  } catch (e) {
    // print(e);
    return facturaVacia;
  }
}

Future buscarFacturaPorNumero(String numeroFactura) async {
  try {
    var response = await http.get(Uri.parse("http://localhost:8080/api/buscarfactura/?numeroFactura=${numeroFactura}"), 
    headers: {  'content-type': 'application/json' },);
    if (response.statusCode == 200) {
      // print(response.request);
      // print(jsonDecode(response.body));
      // print(response.statusCode);
      final facturaBuscada = UnaFacturaBuscada.fromJson(jsonDecode(response.body));
      // final factura = unaFacturaBuscadaFromJson(response.body);
      // print('Minutos;: ${facturaBuscada.unafactura.cantidadLetras}');
      return facturaBuscada;
    }else if (response.statusCode == 404) { 
      // print(response.statusCode);
      return response.statusCode;
    }
  } catch (e) {
    print(e);
    return e;
  }
}