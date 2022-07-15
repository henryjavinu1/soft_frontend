// To parse this JSON data, do
//
//     final detalleVenta = detalleVentaFromJson(jsonString);

import 'dart:convert';

DetalleVenta detalleVentaFromJson(String str) => DetalleVenta.fromJson(json.decode(str));

String detalleVentaToJson(DetalleVenta data) => json.encode(data.toJson());

class DetalleVenta {
    DetalleVenta({
        required this.todosLosDetalles,
    });

    List<TodosLosDetalle> todosLosDetalles;

    factory DetalleVenta.fromJson(Map<String, dynamic> json) => DetalleVenta(
        todosLosDetalles: List<TodosLosDetalle>.from(json["todosLosDetalles"].map((x) => TodosLosDetalle.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "todosLosDetalles": List<dynamic>.from(todosLosDetalles.map((x) => x.toJson())),
    };
}

class TodosLosDetalle {
    TodosLosDetalle({
        required this.id,
        required this.cantidad,
        required this.precioUnitario,
        required this.isvAplicado,
        required this.descuentoAplicado,
        required this.totalDetalleVenta,
        required this.isDelete,
        required this.createdAt,
        required this.updatedAt,
        required this.idVentas,
        required this.idProducto,
    });

    int id;
    int cantidad;
    String precioUnitario;
    String isvAplicado;
    String descuentoAplicado;
    String totalDetalleVenta;
    bool isDelete;
    DateTime createdAt;
    DateTime updatedAt;
    int idVentas;
    int idProducto;

    factory TodosLosDetalle.fromJson(Map<String, dynamic> json) => TodosLosDetalle(
        id: json["id"],
        cantidad: json["cantidad"],
        precioUnitario: json["precioUnitario"],
        isvAplicado: json["isvAplicado"],
        descuentoAplicado: json["descuentoAplicado"],
        totalDetalleVenta: json["totalDetalleVenta"],
        isDelete: json["isDelete"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        idVentas: json["idVentas"],
        idProducto: json["idProducto"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cantidad": cantidad,
        "precioUnitario": precioUnitario,
        "isvAplicado": isvAplicado,
        "descuentoAplicado": descuentoAplicado,
        "totalDetalleVenta": totalDetalleVenta,
        "isDelete": isDelete,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "idVentas": idVentas,
        "idProducto": idProducto,
    };
}
