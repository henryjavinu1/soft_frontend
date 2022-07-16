import 'dart:convert';
import 'dart:js_util';
import 'package:flutter/material.dart';
import '../models/cliente.model.dart';
import '../services/cliente.service.dart';

Future<Cliente?> crearCliente_Controller(
    String dni,
    String email,
    String rtn,
    String nombreCliente,
    String direccion,
    String telefonoCliente,
    context) async {
  if (dni.isNotEmpty &&
      nombreCliente.isNotEmpty &&
      direccion.isNotEmpty &&
      telefonoCliente.isNotEmpty &&
      email.isNotEmpty) {
    List<Cliente?> cliente = await crearCliente(
        dni, email, rtn, nombreCliente, direccion, telefonoCliente);
    if (cliente != null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Cliente cliente añadido con exito")));
    } else {
      
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Campos en blanco")));
  }
}
