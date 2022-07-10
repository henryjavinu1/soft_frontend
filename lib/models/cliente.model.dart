class ClienteBuscado {
  ClienteBuscado({
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
  DateTime createdAt;
  DateTime updatedAt;

  factory ClienteBuscado.fromJson(Map<String, dynamic> json) => ClienteBuscado(
        id: json["id"],
        dni: json["dni"],
        email: json["email"],
        rtn: json["rtn"],
        nombreCliente: json["nombreCliente"],
        direccion: json["direccion"],
        telefonoCliente: json["telefonoCliente"],
        isDelete: json["isDelete"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dni": dni,
        "email": email,
        "rtn": rtn,
        "nombreCliente": nombreCliente,
        "direccion": direccion,
        "telefonoCliente": telefonoCliente,
        "isDelete": isDelete,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
