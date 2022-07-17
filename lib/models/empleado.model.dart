import 'dart:convert';


class Empleado {
    Empleado({
        required this.id,
        required this.dni,
        required this.nombre,
        required this.apellido,
        required this.direccion,
        required this.telefono,
        required this.fechaNacimiento,
        required this.sexo,
        required this.isDelete,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String dni;
    String nombre;
    String apellido;
    String direccion;
    String telefono;
    String fechaNacimiento;
    String sexo;
    bool isDelete;
    DateTime createdAt;
    DateTime updatedAt;

    factory Empleado.fromJson(String str) => Empleado.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Empleado.fromMap(Map<String, dynamic> json) => Empleado(
        id: json["id"],
        dni: json ["dni"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        fechaNacimiento: json["fechaNacimiento"],
        sexo: json["sexo"],
        isDelete: json["isDelete"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "dni": dni,
        "nombre": nombre,
        "apellido": apellido,
        "direccion": direccion,
        "telefono": telefono,
        "fechaNacimiento": fechaNacimiento,
        "sexo": sexo,
        "isDelete": isDelete,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}