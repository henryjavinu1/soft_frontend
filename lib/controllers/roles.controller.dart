import 'dart:convert';
import 'dart:js';
import '../models/rol.model.dart';
import '../services/rol.service.dart';

//bloc
//provider
//

Future<bool> CreaRol(String rol, String descripcion) async {
  Rol? Role = await crearRol(rol, descripcion, context);
  if (Role != null) {
    return true;
  } else {
    return false;
  }
}
