import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/Producto.model.dart';
import 'package:soft_frontend/models/buscarProducto.dart';
import 'dart:convert';

Future<List<Producto>> obtenerProductos() async {
  var data = [];
  var url = Uri.parse("http://localhost:8080/api/producto/mostrarproductos");
  var response = await http.get(url);
  List<Producto> listadoProductos = [];
  try {
    if (response.statusCode == 200) {
      var units = (json.decode(response.body) as Map<String, dynamic>)["producto"];
      for (var u in units) {
        String idString = (u["id"]).toString();
        String cantidadProductoString = (u["cantidadProducto"]).toString();
        String precioString = (u["precioProducto"]).toString();
        String isvString = (u["isvProducto"].toString());
        String descString = (u["descProducto"].toString());
        String isExcentoString = (u["isExcento"].toString());
        String idTipoProductoString = (u["idTipoProducto"].toString());

        Producto producto = Producto(
            id: idString,
            codigoProducto: u["codigoProducto"],
            nombreProducto: u["nombreProducto"],
            precioProducto: precioString,
            cantidadProducto: cantidadProductoString,
            isvProducto: isvString,
            descProducto: descString,
            isExcento: isExcentoString,
            idTipoProducto: idTipoProductoString);
        listadoProductos.add(producto);
      }
    } else {
      print('Api error');
    }
  } on Exception catch (e) {
    print('error: $e');
  }
  return listadoProductos;
}

Future<void> crearProducto(
    String codigoProducto,
    String nombreProducto,
    String precioProducto,
    String cantidadProducto,
    String isvProducto,
    String descProducto,
    String isExcento,
    String idTipoProducto,
    context) async {
  if (codigoProducto.isNotEmpty &&
      nombreProducto.isNotEmpty &&
      precioProducto.isNotEmpty &&
      cantidadProducto.isNotEmpty &&
      isvProducto.isNotEmpty &&
      descProducto.isNotEmpty &&
      isExcento.isNotEmpty &&
      idTipoProducto.isNotEmpty) {
    var response = await http.post(
        Uri.parse("http://localhost:8080/api/producto/crearproducto/"),
        body: ({
          'codigoProducto': codigoProducto,
          'nombreProducto': nombreProducto,
          'precioProducto': precioProducto,
          'cantidadProducto': cantidadProducto,
          'isvProducto': isvProducto,
          'descProducto': descProducto,
          'isExcento': isExcento,
          'idTipoProducto': idTipoProducto,
        }));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Producto creado exitosamente.")));
    } else {}
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al crear el producto.")));
  }
}

Future<void> ActualizarProducto(String idTipoProducto, String tipoProducto,
    String descripcionProducto, String isvTipoProducto, context) async {
  if (idTipoProducto.isNotEmpty &&
      tipoProducto.isNotEmpty &&
      descripcionProducto.isNotEmpty &&
      isvTipoProducto.isNotEmpty) {
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
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Tipo de Producto eliminado.")));
  }
}

Future<Producto> buscarProducto(String codigoProductoR, context) async {
  Producto productoBuscado = Producto(
      id: "1",
      codigoProducto: "2",
      nombreProducto: "m",
      precioProducto: "12",
      cantidadProducto: "asda",
      isvProducto: "asda",
      descProducto: "21",
      isExcento: "sads",
      idTipoProducto: "121");
  if (codigoProductoR.isNotEmpty) {
    var response = await http.post(Uri.parse("http://localhost:8080/api/producto/buscarproductoxcodigo"),
        body: ({'codigoProducto': codigoProductoR}));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      var units = (json.decode(response.body) as Map<String, dynamic>)["producto"];
      String idString = (units["id"]).toString();
      String cantidadProductoString = (units["cantidadProducto"]).toString();
      String precioString = (units["precioProducto"]).toString();
      String isvString = (units["isvProducto"].toString());
      String descString = (units["descProducto"].toString());
      String isExcentoString = (units["isExcento"].toString());
      String idTipoProductoString = (units["idTipoProducto"].toString());

      String codigoProducto = units["codigoProducto"];
      String nombreProducto = units["nombreProducto"];

      Producto nuevoProducto = Producto(id: idString, codigoProducto: codigoProducto, nombreProducto: nombreProducto, precioProducto: precioString, cantidadProducto: cantidadProductoString, isvProducto: isvString, descProducto: descString, isExcento: isExcentoString, idTipoProducto: idTipoProductoString);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Producto encontrado")));
      return nuevoProducto;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Producto no encontrado.")));
      productoBuscado.nombreProducto = 'No encontrado';
      productoBuscado.codigoProducto = 'No encontrado';
      return productoBuscado;
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al encontrar el producto")));
    productoBuscado.nombreProducto = 'No encontrado';
    return productoBuscado;
  }
}

