import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/constans.dart';
import 'package:soft_frontend/models/models.dart';

Future<List<Empleado?>> crearEmpleado(
    String dni,
    String nombre,
    String apellido,
    String direccion,
    String telefono,
    String fechaNacimiento,
    String sexo) async {
  var client = http.Client();
  Empleado? empleado = null;
  List<Empleado?> empleadoCreado = [];
  try {
    var response =
        await client.post(Uri.parse(API_URL + "empleado/crearempleado"),
            body: ({
              'dni': dni,
              'nombre': nombre,
              'apellido': apellido,
              'direccion': direccion,
              'telefono': telefono,
              'fechaNacimiento': fechaNacimiento,
              'sexo': sexo
            }));
    print(response.body);
    if (response.statusCode == 200) {
      print(Empleado);
      //return empleadoCreado;
    } else {
      // return empleadoCreado;
    }
    return empleadoCreado;
  } catch (e) {
    return empleadoCreado;
  } finally {
    client.close();
  }
}
Future traerEmpleados() async {
  try {
    final response = await http.post(Uri.parse(API_URL+"cliente/traerTodosLosEmpleados"));
    if (response.statusCode == 200) {
      // print(response.request);
      // print(jsonDecode(response.body));
      Cliente listaCliente = clienteFromJson(response.body);
      return listaCliente;
    }
  } catch (e) {
    
  }
}
