import 'dart:convert';
import '../models/rol.model.dart';
import '../services/rol.service.dart';

//bloc
//provider
//

Future<bool> CreaRol(String rol, String descripcion, context) async {
  Rol? Role = await crearRol(rol, descripcion, context);
  if (Role != null) {
    return true;
  } else {
    return false;
  }
}
