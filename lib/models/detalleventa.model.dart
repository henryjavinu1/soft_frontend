import 'dart:convert';

class DetalleVenta {
    DetalleVenta({
        required this.id,
        required this.cantidad,
        required this.precioUnitario,
        required this.isvAplicado,
        required this.descuentoAplicado,
        required this.totalDetalleVenta,
        required this.isDelete,
        required this.idVentas,
        required this.updatedAt,
        required this.createdAt,
        required this.idProducto,
        
    });

    int id;
    int cantidad;
    double precioUnitario;
    double isvAplicado;
    double descuentoAplicado;
    double totalDetalleVenta;
    bool isDelete;
    DateTime updatedAt;
    DateTime createdAt;
    int idVentas;
    int idProducto;
    

    factory DetalleVenta.fromJson(String str) => DetalleVenta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DetalleVenta.fromMap(Map<String, dynamic> json) => DetalleVenta(
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

    Map<String, dynamic> toMap() => {
        "id": id,
        "cantidad":cantidad,
        "precioUnitario":precioUnitario,
        "isvAplicado":isvAplicado,
        "descuentoAplicado": descuentoAplicado,
        "totalDetalleVenta":totalDetalleVenta,
        "isDelete":isDelete,
        "createdAt":createdAt,
        "updatedAt": updatedAt,
        "idProducto ":idProducto ,
        "idVentas ":idVentas ,
   
    };
}