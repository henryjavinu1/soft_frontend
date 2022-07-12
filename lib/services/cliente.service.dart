import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/models.dart';

// ignore: non_constant_identifier_names
Future<void> crearCliente(String dni, String email, String rtn, String nombre, String direccion, String telefono, context) async {
  if (dni.isNotEmpty &&
      rtn.isNotEmpty &&
      nombre.isNotEmpty &&
      direccion.isNotEmpty &&
      telefono.isNotEmpty && email.isNotEmpty) {
    var response =
        await http.post(Uri.parse("http://localhost:8080/api/cliente/crearCliente"),
            body: ({
              'dni': dni,
              'email': email,
              'rtn': rtn,
              'nombreCliente': nombre,
              'direccion': direccion,
              'telefonoCliente': telefono
            }));

    if (response.statusCode == 200) {
            ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Cliente Creado")));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Error al crear un cliente")));
  }
}
Future<void> buscarClienteNombre(String nombre, context) async {
  if (
      nombre.isNotEmpty) {
    var response =
        await http.post(Uri.parse("http://localhost:8080/api/cliente/buscarClientePorNombre"),
            body: ({
              'nombreCliente': nombre
            }));


    if (response.statusCode == 200) {
            Cliente cliente = Cliente.fromJson(response.body);
            print(cliente.telefonoCliente);
            ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Cliente Creado")));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Error al crear un cliente")));
  }
}

Future<void> buscarClienteDni(String dni, context) async {
  if (dni.isNotEmpty) {
    var response =
        await http.post(Uri.parse("http://localhost:8080/api/cliente/buscarcliente"),
            body: ({
              'dni': dni
            }));


    if (response.statusCode == 200) {
          Cliente cliente = Cliente.fromJson(response.body);
          print(cliente.nombreCliente);
            ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Cliente encontrado")));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Error al encontrar el cliente")));
  }
}