import 'package:flutter/material.dart';
import 'package:soft_frontend/models/empleado.model.dart';
import '../models/empleado.model.dart';
import '../services/empleado.service.dart';

Future<Empleado?> crearEmpleado_Controller(
    String dni,
    String nombre,
    String apellido,
    String direccion,
    String telefono,
    String fechaNacimiento,
    String sexo,
    context) async {
  if (dni.isNotEmpty &&
      nombre.isNotEmpty &&
      apellido.isNotEmpty &&
      direccion.isNotEmpty &&
      telefono.isNotEmpty &&
      fechaNacimiento.isNotEmpty &&
      sexo.isNotEmpty) {
    List<Empleado?> empleado = await crearEmpleado( dni,
        nombre, apellido, direccion, telefono, fechaNacimiento, sexo);
    if (empleado != null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Empleado empleado añadido con exito")));
    } else {
      
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Campos en blanco")));
  }
}