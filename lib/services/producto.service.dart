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

Future<void> crearProducto(String codigoProducto, String nombreProducto,
    String precioProducto, String cantidadProducto, String isvProducto, String descProducto, String isExcento, String idTipoProducto, context) async {
  if (codigoProducto.isNotEmpty &&
      nombreProducto.isNotEmpty &&
      precioProducto.isNotEmpty &&
      cantidadProducto.isNotEmpty &&
      isvProducto.isNotEmpty &&
      descProducto.isNotEmpty &&
      isExcento.isNotEmpty &&
      idTipoProducto.isNotEmpty
      ) {
    var response = await http.post(
        Uri.parse("http://localhost:8080/api/producto/crearproducto/"),
        body: ({
          'codigoProducto': codigoProducto,
          'nombreProducto': nombreProducto,
          'precioProducto' : precioProducto,
          'cantidadProducto': cantidadProducto,
          'isvProducto': isvProducto,
          'descProducto': descProducto,
          'isExcento': isExcento,
          'idTipoProducto': idTipoProducto,
        }));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Producto creado exitosamente.")));
    } else {

    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al crear el producto.")));
  }
}

Future<void> ActualizarProducto(String idTipoProducto, String tipoProducto,
    String descripcionProducto, String isvTipoProducto, context) async {
  if (idTipoProducto.isNotEmpty && tipoProducto.isNotEmpty &&
      descripcionProducto.isNotEmpty && isvTipoProducto.isNotEmpty) {
    var response = await http.post(
        Uri.parse("http://localhost:8080/api/producto/actualizartipo/"),
        body: ({
          'id': idTipoProducto,
          'tipoProducto': tipoProducto,
          'descripcionProducto': descripcionProducto,
          'isvTipoProducto': isvTipoProducto
        }));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Tipo de Producto Actualizado.")));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al actualizar tipo de Producto")));
  }
}

Future<void> EliminarProducto(String idTipoProducto, context) async {
  var response = await http.post(
      Uri.parse("http://localhost:8080/api/producto/eliminartipo"),
      body: ({
        'id': idTipoProducto,
      }));

  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Tipo de Producto eliminado.")));
  }
}


