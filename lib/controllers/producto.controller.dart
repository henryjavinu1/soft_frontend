import 'package:flutter/material.dart';
import 'package:soft_frontend/models/empleado.model.dart';
import '../models/Producto.model.dart';
import '../services/producto.service.dart';

Future<Producto?> crearProductoController(
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
      idTipoProducto.isNotEmpty) {
      List<Producto?> producto = await crearProducto2(codigoProducto, nombreProducto, precioProducto, cantidadProducto, isvProducto, descProducto, isExcento, idTipoProducto, context);
    if (producto != null) {
       ScaffoldMessenger.of(context)               
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Producto creado con éxito.'),
              ));
    } else {
       ScaffoldMessenger.of(context)               
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Error al crear el producto.'),
              ));
      
    }
  } else {
    ScaffoldMessenger.of(context)               
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Por favor rellene todos los campos'),
              ));
  }
}


Future<Producto?> actualizaProductoController(
    String id,
    String codigoProducto,
    String nombreProducto,
    String precioProducto,
    String cantidadProducto,
    String isvProducto,
    String descProducto,
    String isExcento,
    String idTipoProducto,
    context) async {
  if (id.isEmpty &&
      codigoProducto.isNotEmpty &&
      nombreProducto.isNotEmpty &&
      precioProducto.isNotEmpty &&
      cantidadProducto.isNotEmpty &&
      isvProducto.isNotEmpty &&
      descProducto.isNotEmpty &&
      isExcento.isNotEmpty &&
      idTipoProducto.isNotEmpty) {
    List<Producto?> producto = await ActualizarProducto2(id, codigoProducto, nombreProducto, precioProducto, cantidadProducto, isvProducto, descProducto, isExcento, idTipoProducto, context );
    if (producto != null) {
      ScaffoldMessenger.of(context)               
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Producto actualizado con éxito.'),
              ));
            
    } else {}
  } else {
    ScaffoldMessenger.of(context)               
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Por favor rellene todos los campos'),
              ));
  }
}

Future<Producto?> eliminarProductoController(String id, context) async {
  List<Producto?> producto = await eliminarProducto2(id);
  print(id);
  if (producto != null) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Producto eliminado con éxito.")));
  } else {}
}