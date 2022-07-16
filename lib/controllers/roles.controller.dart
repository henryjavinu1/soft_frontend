import 'dart:convert';
import '../models/rol.model.dart';
import '../services/rol.service.dart';

//bloc
//provider
//

Future<bool> RolController(String rol, String descripcion) async {
  Rol? role = await crearRol(rol, descripcion);
  if (role != null) {
    return true;
  } else {
    return false;
  }
}
