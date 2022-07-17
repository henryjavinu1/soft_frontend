import 'package:soft_frontend/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/mostrarUnaFactura.model.dart';

import '../constans.dart';

Future<List<TodosLosDetalle>> mostrardetalleventa() async {
  List<TodosLosDetalle> detalleVentaVacia = [];
  try {
    var response =
        await http.post(Uri.parse(API_URL + "mostrarDetalle"));
   // print(response.body);
   // DetalleVenta detalleVenta = DetalleVenta.fromJson();
    if (response.statusCode == 200) {
      final DetalleVenta = detalleVentaFromJson(response.body);
      print(DetalleVenta.todosLosDetalles[1].id);
    } else {

    }
    return detalleVentaVacia;
  } catch (e) {
    return detalleVentaVacia;
  }
}

Future<List<DetalleVenta?>> crearDetalle(int cantidad, double precioUnitario, double isvAplicado,
    double descuentoAplicado, double totalDetalleVenta, int idVentas, int idProducto) async {
  var client = http.Client();
  DetalleVenta? detalleVenta = null;
  List<DetalleVenta?> detalleCreado = [];
  try {
    var response = await http.post(Uri.parse(API_URL + "detalleventa"),
        body: ({
          'cantidad': cantidad,
          'precioUnitario': precioUnitario,
          'isvAplicado': isvAplicado,
          'descuentoAplicado': descuentoAplicado,
          'totalDetalleVenta': totalDetalleVenta,
          'idVentas': idVentas,
          'idProducto':idProducto
        }));
    print(response.body);
    if (response.statusCode == 200) {
      print(DetallesDeVenta);
    } else {
    }
    return detalleCreado;
  } catch (e) {
    return detalleCreado;
  } finally {
    http.Client().close();
  }
}