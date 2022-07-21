import 'dart:convert';

class Sucursal {
  Sucursal({
    required this.sucursal,
  });

  DetalleSucursal sucursal;

  factory Sucursal.fromJson(String str) => Sucursal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sucursal.fromMap(Map<String, dynamic> json) => Sucursal(
        sucursal: DetalleSucursal.fromMap(json["sucursal"]),
      );

  Map<String, dynamic> toMap() => {
        "sucursal": sucursal.toMap(),
      };
}

class DetalleSucursal {
  DetalleSucursal({
    required this.idSucursal,
    required this.nombreSucursal,
    required this.lemaSucursal,
    required this.createdAt,
    required this.updatedAt,
  });

  int idSucursal;
  String nombreSucursal;
  String lemaSucursal;
  DateTime createdAt;
  DateTime updatedAt;

  factory DetalleSucursal.fromJson(String str) =>
      DetalleSucursal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetalleSucursal.fromMap(Map<String, dynamic> json) => DetalleSucursal(
        idSucursal: json["idSucursal"],
        nombreSucursal: json["nombreSucursal"],
        lemaSucursal: json["lemaSucursal"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "idSucursal": idSucursal,
        "nombreSucursal": nombreSucursal,
        "lemaSucursal": lemaSucursal,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
