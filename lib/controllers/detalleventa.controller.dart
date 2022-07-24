import 'dart:convert';
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
    if (detalleventa is IdDetalleVenta) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Detalle añadido con exito')));
      return detalleventa;
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
    TextEditingController codigoProducto, context) async {
  if (codigoProducto.text.isNotEmpty) {
    final response = await buscarProductoService(codigoProducto.text.trim(), context);
    if (response is Producto) {
      final detalle = await crearDetalle_Controller(
          '1', '22', '123456', '25', '10', '1', '1', context);
      if (detalle is IdDetalleVenta) {
        return detalle;
      } else {
        return false;
      }
          } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'No se encontró el cliente con el DNI: por favor verifique la identidad del cliente o creelo en la base de datos.')));
      return false;
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'No se permiten campos vacíos, por favor ingrese un número de DNI.')));
    return false;
  }
}
      //return response;

      /*
    } else if (response == 404) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No se encontró el producto buscado.')));
    } else if (response == 500) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Hubo un error interno en el servidor al buscar el producto.')));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Por favor ingrese un código de producto para realizar la búsqueda.')));
  }
}
*/