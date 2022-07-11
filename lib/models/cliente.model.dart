// To parse this JSON data, do
//
//     final cliente = clienteFromMap(jsonString);

import 'dart:convert';

class Cliente {
    Cliente({
        required this.id,
        required this.dni,
        required this.email,
        required this.rtn,
        required this.nombreCliente,
        required this.direccion,
        required this.telefonoCliente,
        required this.isDelete,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String dni;
    String email;
    String rtn;
    String nombreCliente;
    String direccion;
    String telefonoCliente;
    bool isDelete;
    dynamic createdAt;
    dynamic updatedAt;

    factory Cliente.fromJson(String str) => Cliente.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cliente.fromMap(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        dni: json["dni"],
        email: json["email"],
        rtn: json["rtn"],
        nombreCliente: json["nombreCliente"],
        direccion: json["direccion"],
        telefonoCliente: json["telefonoCliente"],
        isDelete: json["isDelete"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "dni": dni,
        "email": email,
        "rtn": rtn,
        "nombreCliente": nombreCliente,
        "direccion": direccion,
        "telefonoCliente": telefonoCliente,
        "isDelete": isDelete,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}