import 'dart:convert';

class Ventas {
    Ventas({
        required this.id,
        required this.totalISV,
        required this.totalVenta,
        required this.totalDescuentoVenta,
        required this.isDelete,
        required this.puntoDeEmision,
        required this.establecimiento,
        required this.tipo,
        required this.updatedAt,
        required this.createdAt,
        required this.idSesion,
        required this.idUsuario,
        required this.idCliente,
    });

    int id;
    double totalISV;
    double totalVenta;
    double totalDescuentoVenta;
    bool isDelete;
    String puntoDeEmision;
    String establecimiento;
    String tipo;
    DateTime updatedAt;
    DateTime createdAt;
    int idSesion;
    int idUsuario;
    int idCliente;

    factory Ventas.fromJson(String str) => Ventas.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Ventas.fromMap(Map<String, dynamic> json) => Ventas(
        id: json["id"],
        totalISV: json["totalISV"],
        totalVenta: json["totalVenta"],
        totalDescuentoVenta: json["totalDescuentoVenta"],
        isDelete: json["isDelete"],
        puntoDeEmision: json["puntoDeEmision"],
        establecimiento: json["establecimiento"],
        tipo: json["tipo"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        idSesion: json["idSesion"],
        idUsuario: json["idUsuario"],
        idCliente: json["idCliente"]
        
        
        
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "totalISV":totalISV,
        "totalVenta":totalVenta,
        "totalDescuentoVenta":totalDescuentoVenta,
        "isDelete": isDelete,
        "puntoDeEmision":puntoDeEmision,
        "establecimiento":establecimiento,
        "tipo":tipo,
        "idUsuario": idUsuario,
        "idSesion":idSesion,
        "idCliente":idCliente,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
    };
}