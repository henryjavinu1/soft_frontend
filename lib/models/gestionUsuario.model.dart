import 'dart:convert';
import 'package:soft_frontend/models/models.dart';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));
String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.todoslosUsuarios,
  });

  List<TodosLosUsuarios> todoslosUsuarios;
  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        todoslosUsuarios: List<TodosLosUsuarios>.from(
            json['todoslosUsuarios'].map((x) => TodosLosUsuarios.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'todoslosUsuarios':
            List<dynamic>.from(todoslosUsuarios.map((x) => x.toJson())),
      };
}

class TodosLosUsuarios {
  TodosLosUsuarios({
    required this.id,
    required this.usuario,
    required this.password,
    required this.email,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
    //required this.empleado,
    required this.idEmpleado,
    required this.idRol,
  });

  int id;
  String usuario;
  String password;
  String email;
  bool isDelete;
  DateTime createdAt;
  DateTime updatedAt;
  //TodoslosEmpleados empleado;
  int idEmpleado;
  int idRol;

  factory TodosLosUsuarios.fromJson(Map<String, dynamic> json) =>
      TodosLosUsuarios(
          id: json['id'] ?? 0,
          usuario: json['usuario'] ?? '',
          password: json[''] ?? '',
          email: json['email'] ?? '',
          isDelete: json['isDelete'] ?? false,
          createdAt: DateTime.parse(json['createdAt']),
          updatedAt: DateTime.parse(json['updatedAt']),
          //empleado: TodoslosEmpleados.fromJson(json['dni']),
          idEmpleado: json['idEmpleado'] ?? 0,
          idRol: json['idRol'] ?? 0);

  Map<String, dynamic> toJson() => {
        'id': id,
        'usuario': usuario,
        'password': password,
        'email': email,
        'isDelete': isDelete,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        //'empleado': empleado.toJson(),
        'idEmpleado': idEmpleado,
        'idRol': idRol,
      };
}
