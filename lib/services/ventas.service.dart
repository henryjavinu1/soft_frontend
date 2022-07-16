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
