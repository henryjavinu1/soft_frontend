import 'dart:convert';

Producto productoFromJson(String str) => Producto.fromJson(json.decode(str));
String productoToJson(Producto data) => json.encode(data.toJson());


class Producto {
  String? id;
  String? codigoProducto;
  String? nombreProducto;
  String? precioProducto;
  String? cantidadProducto;
  String? isvProducto;
  String? descProducto;
  String? isExcento;
  String? idTipoProducto;
  String? isDelete;
  String? createdAt;
  String? updatedAt;


  Producto({
    this.id,
    this.codigoProducto,
    this.nombreProducto,
    this.precioProducto,
    this.cantidadProducto,
    this.isvProducto,
    this.descProducto,
    this.isExcento,
    this.idTipoProducto
  });

  Producto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codigoProducto = json['codigoProducto'];
    nombreProducto = json['nombreProducto'];
    precioProducto = json['precioProducto'];
    cantidadProducto = json['cantidadProducto'];
    isvProducto = json['isvProducto'];
    descProducto = json['descProducto'];
    isExcento = json['isExcento'];
    idTipoProducto = json['idTipoProducto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['codigoProducto'] = this.codigoProducto;
    data['nombreProducto'] = this.nombreProducto;
    data['precioProducto'] = this.precioProducto;
    data['cantidadProducto'] = this.cantidadProducto;
    data['isvProducto'] = this.isvProducto;
    data['descProducto'] = this.descProducto;
    data['isExcento'] = this.isExcento;
    data['idTipoProducto'] = this.idTipoProducto;
    return data;
  }
}