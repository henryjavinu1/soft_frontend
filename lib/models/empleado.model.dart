import 'dart:convert';


class Empleado {
    Empleado({
        required this.id,
        required this.nombre,
        required this.apellido,
         this.direccion,
         this.telefono,
         this.fechaNacimiento,
        required this.sexo,
        required this.isDelete,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String nombre;
    String apellido;
    dynamic direccion;
    dynamic telefono;
    dynamic fechaNacimiento;
    String sexo;
    bool isDelete;
    DateTime createdAt;
    DateTime updatedAt;

    factory Empleado.fromJson(String str) => Empleado.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Empleado.fromMap(Map<String, dynamic> json) => Empleado(
        id: json["id"],
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