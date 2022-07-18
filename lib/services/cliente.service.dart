import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
<<<<<<< HEAD
import 'package:soft_frontend/models/cliente.model.dart';

// ignore: non_constant_identifier_names
Future<void> crearCliente(String dni, String email, String rtn, String nombre,
    String direccion, String telefono, context) async {
  if (dni.isNotEmpty &&
      rtn.isNotEmpty &&
      nombre.isNotEmpty &&
      direccion.isNotEmpty &&
      telefono.isNotEmpty &&
      email.isNotEmpty) {
    var response = await http.post(
        Uri.parse("http://localhost:8080/api/cliente/crearCliente"),
        body: ({
          'dni': dni,
          'email': email,
          'rtn': rtn,
          'nombreCliente': nombre,
          'direccion': direccion,
          'telefonoCliente': telefono
        }));
=======
import 'package:soft_frontend/constans.dart';
import 'package:soft_frontend/models/models.dart';

import '../models/cliente.model.dart';
>>>>>>> 04bed23b273ac1223ea4b2b34ee716c0ba0e414a

// ignore: non_constant_identifier_names
Future<List<Cliente?>> crearCliente(String dni, String email, String rtn,/////////////////
    String nombre, String direccion, String telefono) async {
  var client = http.Client();
  Cliente? cliente = null;
  List<Cliente?> clienteCreado = [];
  try {
    var response = await http.post(Uri.parse(API_URL + "cliente/crearCliente"),
        body: ({
          'dni': dni,
          'email': email,
          'rtn': rtn,
          'nombreCliente': nombre,
          'direccion': direccion,
          'telefonoCliente': telefono
        }));
    print(response.body);
    if (response.statusCode == 200) {
<<<<<<< HEAD
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Cliente Creado")));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al crear un cliente")));
=======
      print(Cliente);
      //return clienteCreado;
    } else {
      // return clienteCreado;
    }
    return clienteCreado;
  } catch (e) {
    return clienteCreado;
  } finally {
    http.Client().close();
  }
}
Future<List<Cliente?>> eliminarCliente(String id) async {
  print(id);
  var client = http.Client();
  Cliente? cliente = null;
  List<Cliente?> clienteCreado = [];
  try {
    var response = await http.post(Uri.parse(API_URL + "cliente/eliminarCliente"),
        body: ({
          'id' : id
        }));
    print(response.body);
    if (response.statusCode == 200) {
      print(Cliente);
      //return clienteCreado;
    } else {
      // return clienteCreado;
    }
    return clienteCreado;
  } catch (e) {
    print(e);
    return clienteCreado;
  } finally {
    http.Client().close();
  }
}
Future<List<Cliente?>> ActualizarCliente(String id, String dni, String email, String rtn,
    String nombre, String direccion, String telefono) async {////////////////
  var client = http.Client();
  Cliente? cliente = null;
  List<Cliente?> clienteCreado = [];
  try {
    var response = await http.put(Uri.parse(API_URL + "cliente/actualizarCliente"),
        body: ({
          'id': id,
          'dni': dni,
          'rtn': rtn,
          'email': email,
          'nombreCliente': nombre,
          'direccion': direccion,
          'telefonoCliente': telefono
        }));
    print(response.body);
    if (response.statusCode == 200) {
      print(Cliente);
      //return clienteCreado;
    } else {
      // return clienteCreado;
    }
    return clienteCreado;
  } catch (e) {
    return clienteCreado;
  } finally {
    http.Client().close();
>>>>>>> 04bed23b273ac1223ea4b2b34ee716c0ba0e414a
  }
}

Future<void> buscarClienteNombre(String nombre, context) async {
  if (nombre.isNotEmpty) {
    var response = await http.post(
<<<<<<< HEAD
        Uri.parse("http://localhost:8080/api/cliente/buscarClientePorNombre"),
        body: ({'nombreCliente': nombre}));

    if (response.statusCode == 200) {
      Cliente cliente = Cliente.fromJson(response.body);
      print(cliente.telefonoCliente);
=======
        Uri.parse(API_URL + "cliente/buscarClientePorNombre"),
        body: ({'nombreCliente': nombre}));

    if (response.statusCode == 200) {
      Cliente cliente = clienteFromJson(response.body);
>>>>>>> 04bed23b273ac1223ea4b2b34ee716c0ba0e414a
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Cliente Creado")));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
<<<<<<< HEAD
        const SnackBar(content: Text("Error al crear un cliente")));
=======
        const SnackBar(content: Text("Favor llenar todos los campos")));
  }
}

Future traerClientes() async {
  try {
    final response = await http.post(Uri.parse(API_URL+"cliente/traerTodosLosClientes"));///////////////
    if (response.statusCode == 200) {
      // print(response.request);
      // print(jsonDecode(response.body));
      Cliente listaCliente = clienteFromJson(response.body);
      return listaCliente;
    }
  } catch (e) {
    
>>>>>>> 04bed23b273ac1223ea4b2b34ee716c0ba0e414a
  }
}

Future<void> buscarClienteDni(String dni, context) async {
  if (dni.isNotEmpty) {
<<<<<<< HEAD
    var response = await http.post(
        Uri.parse("http://localhost:8080/api/cliente/buscarcliente"),
        body: ({'dni': dni}));

    if (response.statusCode == 200) {
      Cliente cliente = Cliente.fromJson(response.body);
      print(cliente.nombreCliente);
=======
    var response = await http.post(Uri.parse(API_URL + "cliente/buscarcliente"),
        body: ({'dni': dni}));

    if (response.statusCode == 200) {
      Cliente cliente = clienteFromJson(response.body);

>>>>>>> 04bed23b273ac1223ea4b2b34ee716c0ba0e414a
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Cliente encontrado")));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al encontrar el cliente")));
  }
}
