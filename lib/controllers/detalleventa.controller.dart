import 'dart:convert';
//import 'dart:ffi';
import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:soft_frontend/models/IdDetalleVenta.model.dart';
import '../models/ProductoBuscado.model.dart';
import '../models/detalleventa.model.dart';
import '../services/detalleventa.service.dart';
import '../services/ventas.service.dart';
import 'package:soft_frontend/models/IdVenta.model.dart';

Future crearDetalle_Controller(
    String cantidad,
    String precioUnitario,
    String totalDetalleVenta,
    String isvAplicado,
    String descuentoAplicado,
    String idVentas,
    String idProducto,
    context) async {
  if (cantidad.isNotEmpty &&
      precioUnitario.isNotEmpty &&
      isvAplicado.isNotEmpty &&
      descuentoAplicado.isNotEmpty &&
      totalDetalleVenta.isNotEmpty &&
      idVentas.isNotEmpty &&
      idProducto.isNotEmpty) {
    final detalleventa = await crearDetalle(
        cantidad,
        precioUnitario,
        isvAplicado,
        descuentoAplicado,
        totalDetalleVenta,
        idVentas,
        idProducto);
    print(detalleventa);
    if (detalleventa == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Detalle añadido con exito')));
      return 200;
    } else if (detalleventa == 500) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Ocurrió un error en el servidor al crear el detalle, comuniquese con el administrador.')));
      return 500;
    } else if (detalleventa == 1928) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Ocurrió un error al crear el detalle, póngase en contacto con el administrador.')));
      return 1928;
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Campos en blanco')));
    return 1928;
  }
}
/*
    if (detalleventa != null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Detalle Venta añadida con exito")));
    } else {}
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Campos en blanco")));
  }
}*/

Future buscarProductoController(
    TextEditingController codigoProducto, TextEditingController cantidadProducController, int idVentaActual, context) async {
      print(cantidadProducController);
  if (codigoProducto.text.isNotEmpty) {
    final response = await buscarProductoService(codigoProducto.text.trim(), context);
    if (response is ProductoBuscado) {
      // multiplicacion (cantidad* precioUnitario) +ISV -DESC
      double cantidad = double.parse(cantidadProducController.text);
      double precio = double.parse(response.producto.precioProducto);
      double isv = double.parse(response.producto.isvProducto);
      double descuento = double.parse(response.producto.descProducto);
      double total = ((cantidad * precio)*(isv/100))+(precio * cantidad) - descuento;
      final detalle = await crearDetalle_Controller(
          cantidadProducController.text, response.producto.precioProducto, total.toString(), response.producto.isvProducto, response.producto.descProducto, idVentaActual.toString(), response.producto.id.toString(), context);
      if (detalle == 200) {
        DetalleDeVentasXid detalles = await mostrardetalleventa(idVentaActual);
        print(detalles);
        return detalles;
      } else {
        return false;
      }
          } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'No se encontró el producto')));
      return false;
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'No se permiten campos vacíos, por favor ingrese un número de DNI.')));
    return false;
  }
}



