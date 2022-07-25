import 'dart:convert';
import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/rol.model.dart';
import '../services/rol.service.dart';

//bloc
//provider
//

Future<Rol?> CreaRol_controller(
    String id, String rol, String descripcion, context) async {
  List<Rol?> role = await crearRol(id, rol, descripcion, context);
  if (role != null) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Rol creado con exito")));
    //Navigator.pushNamed(context, "Traerusuarios");
  }
}
