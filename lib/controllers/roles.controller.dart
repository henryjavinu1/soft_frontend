import 'dart:convert';
import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soft_frontend/models/gestionrol.model.dart';
import '../models/rol.model.dart';
import '../services/rol.service.dart';

//bloc
//provider
//

Future<Rol?> CreaRol_controller(
    String id, String rol, String descripcion, context) async {
  List<Rol?> role = await crearRol(rol, descripcion, context);
  if (role != null) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Rol creado con exito")));
    //Navigator.pushNamed(context, "Traerusuarios");
  }
}

Future<Role?> eliminarrol_Controller(String id, context) async {
  List<Role?> rol = await eliminarRol(id);
  print(id);
  if (rol != null) {
    Navigator.pushNamed(context, "gestionRol");
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Rol eliminado con exito")));
  } else {}
}
