import 'dart:convert';

import 'package:soft_frontend/models/rol.model.dart';
import 'package:soft_frontend/models/sesion.model.dart';

import 'empleado.model.dart';

class User {
    User({
        required this.id,
        required this.usuario,
        required this.empleado,
        required this.rol,
        required this.sesion,
    });

    int id;
    String usuario;
    Empleado empleado;
    Rol rol;
    Sesion sesion;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        usuario: json["usuario"],
        empleado: Empleado.fromMap(json["empleado"]),
        rol: Rol.fromMap(json["rol"]),
        sesion: Sesion.fromMap(json["sesion"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "usuario": usuario,
        "empleado": empleado.toMap(),
        "rol": rol.toMap(),
        "sesion": sesion.toMap(),
    };
}