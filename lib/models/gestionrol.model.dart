import 'dart:convert';

Rol rolFromJson(String str) => Rol.fromJson(json.decode(str));
String rolToJson(Rol data) => json.encode(data.toJson());

class Rol {
  Rol({
    required this.todoslosRol,
  });

  List<TodosLosRol> todoslosRol;
  factory Rol.fromJson(Map<String, dynamic> json) => Rol(
        todoslosRol: List<TodosLosRol>.from(
            json['todoslosRol'].map((x) => TodosLosRol.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        'todoslosRol': List<dynamic>.from(todoslosRol.map((x) => x.toJson())),
      };
}

class TodosLosRol {
  TodosLosRol({
    required this.id,
    required this.rol,
    required this.descripcion,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String rol;
  String descripcion;
  bool isDelete;
  DateTime createdAt;
  DateTime updatedAt;

  factory TodosLosRol.fromJson(Map<String, dynamic> json) => TodosLosRol(
        id: json['id'] ?? 0,
        rol: json['rol'] ?? '',
        descripcion: json['descripcion'] ?? '',
        isDelete: json['isDelete'] ?? false,
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'rol': rol,
        'descripcion': descripcion,
        'isDelete': isDelete,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}
