import 'dart:convert';

import 'package:soft_frontend/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/mostrarUnaFactura.model.dart';

import '../constans.dart';
import '../models/IdDetalleVenta.model.dart';
import '../models/ProductoBuscado.model.dart';
import '../models/detalleventa.model.dart';

Future mostrardetalleventa(int idVenta) async {

  //List<TodosLosDetalle> detalleVentaVacia = [];
  try {
    var response =
        await http.post(Uri.parse(API_URL + 'mostrardetalle'),
        body: ({'idVenta' : idVenta.toString()}));
   // print(response.body);
   // DetalleVenta detalleVenta = DetalleVenta.fromJson();
   print(response.request);
   print(response.statusCode);
    if (response.statusCode == 200) {
      print('hola mundo');
      final detalleVentas = detalleDeVentasXidFromJson(response.body);
      return detalleVentas;
    } 
    
  } catch (e) {
    print(e);
  }
}

Future crearDetalle(String cantidad, String precioUnitario, String isvAplicado,
    String descuentoAplicado, String totalDetalleVenta, String idVentas, String idProducto) async {
  try {
    var response = await http.post(Uri.parse(API_URL + 'detalleventa'),
        body: ({
          'cantidad': cantidad,
          'precioUnitario': precioUnitario,
          'isvAplicado': isvAplicado,
          'descuentoAplicado': descuentoAplicado,
          'totalDetalleVenta': totalDetalleVenta,
          'idVentas': idVentas,
          'idProducto':idProducto
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      // IdDetalleVenta detalleventa = idDetalleVentaFromJson(response.body);
      return 200;
    } else if (response.statusCode == 500) {
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


Future buscarProductoService(String codigoProducto, context) async {
  try {
    var response = await http.post(Uri.parse(API_URL+'producto/buscarproductoxcodigo'),
        body: ({'codigoProducto': codigoProducto}));
    print(jsonDecode(response.body));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final producto = productoBuscadoFromJson(response.body);
      return producto;
    } else if (response.statusCode == 404) {
      return 404;
    } else if (response.statusCode == 500) {
      return 500;
    }
  } catch (e) {
    print(e);
    return 1928;
  }
}