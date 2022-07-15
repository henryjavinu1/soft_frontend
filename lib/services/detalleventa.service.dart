import 'package:soft_frontend/models/models.dart';
import 'package:http/http.dart' as http;

Future<List<TodosLosDetalle>> mostrardetalleventa() async {
  List<TodosLosDetalle> detalleVentaVacia = [];
  try {
    var response =
        await http.post(Uri.parse("http://localhost:8080/api/mostrarDetalle"));
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
