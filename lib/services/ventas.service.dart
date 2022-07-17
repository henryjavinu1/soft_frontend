import 'package:soft_frontend/models/models.dart';
import 'package:http/http.dart' as http;

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

Future<List<Ventas?>> crearVenta(double totalIsv, double totalVenta, double totalDescuentoVenta,
    String puntoDeEmision, String establecimiento, String tipo, int idSesion, int idUsuario, int idCliente) async {
  var client = http.Client();
  Ventas? ventas = null;
  List<Ventas?> ventaCreada = [];
  try {
    var response = await http.post(Uri.parse(API_URL + "ventas"),
        body: ({
          'totalIsv': totalIsv,
          'totalVenta': totalVenta,
          'totalDescuentoVenta': totalDescuentoVenta,
          'puntoDeEmision': puntoDeEmision,
          'establecimiento': establecimiento,
          'tipo': tipo,
          'idSesion':idSesion,
          'idUsuario':idUsuario,
          'idCliente':idCliente
        }));
    print(response.body);
    if (response.statusCode == 200) {
      print(Ventas);
    } else {
    }
    return ventaCreada;
  } catch (e) {
    return ventaCreada;
  } finally {
    http.Client().close();
  }
}