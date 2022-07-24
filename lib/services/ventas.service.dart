import 'dart:convert';

import 'package:soft_frontend/models/IdVenta.model.dart';
import 'package:soft_frontend/models/ProductoBuscado.model.dart';
import 'package:soft_frontend/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/services/cliente.service.dart';

import '../constans.dart';

Future<List<TodasLasVenta>> mostrarVentas() async {
  List<TodasLasVenta> ventasVacias = [];
  try {
    var response =
        await http.post(Uri.parse(API_URL + "mostrarVentas"));
   // print(response.body);
   // DetalleVenta detalleVenta = DetalleVenta.fromJson();
    if (response.statusCode == 200) {
      final Venta = ventasFromJson(response.body);
      print(Venta.todasLasVentas[1].id);
    } else {

    }
    return ventasVacias;
  } catch (e) {
    return ventasVacias;
  }finally{
    http.Client().close();
  }
}

Future crearVenta(String totalISV, String totalVenta, String totalDescuentoVenta,
    String puntoDeEmision, String establecimiento, String tipo, String idSesion, String idUsuario, String idCliente) async {
  try {
    var response = await http.post(Uri.parse(API_URL + 'ventas'),
        body: ({
          'totalISV': totalISV,
          'totalVenta': totalVenta,
          'totalDescuentoVenta': totalDescuentoVenta,
          'puntoDeEmision': puntoDeEmision,
          'establecimiento': establecimiento,
          'tipo': tipo,
          'idSesion':idSesion,
          'idUsuario':idUsuario,
          'idCliente':idCliente
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      IdVenta ventas = idVentaFromJson(response.body);
      return ventas;
    } else if (response.statusCode == 500){
      return response.statusCode;
    }
    print(response.statusCode);
  } catch (e) {
    print(e);
    return 1928;
  } finally {
    http.Client().close();
  }
}

Future buscarClienteVenta(String dni, context) async {
  try {
    final response  = await http.post(Uri.parse(API_URL + 'cliente/buscarcliente'),
          body: ({'dni': dni}));
    if (response.statusCode == 200) {
      final cliente = unClienteFromJson(response.body);
      return cliente;
    } else if (response.statusCode == 404){
      return response.statusCode;
    } else if (response.statusCode == 500) {
      return response.statusCode;
    }
  } catch (e) {
    print(e);
    return 1928;
  }
}

/*
Future buscarProductoService(String codigoProductoR, context) async {
  try {
    var response = await http.post(Uri.parse(API_URL+'producto/buscarproductoxcodigo'),
        body: ({'codigoProducto': codigoProductoR}));

    if (response.statusCode == 200) {
      final producto = productoBuscadoFromJson(response.body);
      return producto;
    } else if (response.statusCode == 404) {
      return 404;
    } else if (response.statusCode == 500) {
      return 500;
    }
  } catch (e) {
    return 1928;
  }
}
*/