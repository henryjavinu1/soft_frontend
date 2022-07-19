import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/Producto.model.dart';
import 'dart:convert';
    
  Future<List<Producto>> obtenerProductos() async{
    var data = [];
    var url = Uri.parse("http://localhost:8080/api/producto/mostrarproductos");
    var response = await http.get(url);
    List<Producto> listadoProductos = [];
    try {
      if (response.statusCode == 200) {
        var units = (json.decode(response.body) as Map<String, dynamic>)["producto"];
        for(var u in units){
          Producto producto = Producto(id: u["id"], codigoProducto: u["codigoProducto"], nombreProducto: u["nombreProducto"], precioProducto: u["precioProducto"], cantidadProducto: u["cantidadProducto"], isvProducto :u["isvProducto"], descProducto: u["descProducto"], isExcento: u["isExcento"], urlImage: u["urlImage"], idTipoProducto: u["idTipoProducto"]);
          listadoProductos.add(producto);
        }
      } else {
        print('Api error');
      }
    } on Exception catch (e){
      print('error: $e');
    }
    return listadoProductos;
  }