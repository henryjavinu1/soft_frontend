import 'dart:convert';
import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:soft_frontend/models/IdVenta.model.dart';
import 'package:soft_frontend/models/ProductoBuscado.model.dart';
import 'package:soft_frontend/models/cliente.model.dart';
import 'package:soft_frontend/services/cliente.service.dart';
import '../models/ventas.model.dart';
import '../services/ventas.service.dart';


Future crearVenta_Controller(
    String totalIsv,
    String totalVenta,
    String totalDescuentoVenta,
    String puntoDeEmision,
    String establecimiento,
    String tipo,
    String idSesion,
    String idUsuario,
    String idCliente,
    context) async {
  if (totalIsv.isNotEmpty &&
      totalVenta.isNotEmpty &&
      totalDescuentoVenta.isNotEmpty &&
      puntoDeEmision.isNotEmpty &&
      establecimiento.isNotEmpty &&
      tipo.isNotEmpty &&
      idSesion.isNotEmpty &&
      idUsuario.isNotEmpty &&
      idCliente.isNotEmpty ) {
    final ventas = await crearVenta(
        totalIsv, totalVenta, totalDescuentoVenta, puntoDeEmision, establecimiento, tipo, idSesion, idUsuario,idCliente);
        print(ventas);
    if (ventas is IdVenta) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Venta añadida con exito')));
      return ventas;
    } else if (ventas == 500) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ocurrió un error en el servidor al crear la venta, comuniquese con el administrador.')));
      return 500;
    } else if (ventas == 1928) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ocurrió un error al crear la venta, póngase en contacto con el administrador.')));
      return 1928;
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Campos en blanco')));
    return 1928;
  }
}

// Controlador para crear una nueva venta
Future habilitarVenta(TextEditingController dniController, TextEditingController nombreController, TextEditingController telefonoController, context) async {
  // Buscar cliente en la base de datos.
  if (dniController.text.isNotEmpty) {
    final response = await buscarClienteVenta(dniController.text.trim(), context);
    if (response is TodoslosCliente) {
      final venta = await crearVenta_Controller('0.0', '0.0', '0.0', '000', '001', '01', '1', '1', response.id.toString(), context);
      if (venta is IdVenta) {
        nombreController.text = response.nombreCliente;
        telefonoController.text = response.telefonoCliente;
        return venta;
      } else {
        return false;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No se encontró el cliente con el DNI: ${dniController.text}, por favor verifique la identidad del cliente o creelo en la base de datos.')));
      return false;
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No se permiten campos vacíos, por favor ingrese un número de DNI.')));
    return false;
  }
}


Future<Ventas?> eliminarVenta_Controller(String id,context) async {
  List<Ventas?> venta = await eliminarVenta(id);
  print(id);
  if (venta != null) {
    Navigator.pushNamed(context, 'ventas');
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Venta eliminada con exito")));
  } else {}
}

/*  Future buscarProductoController(TextEditingController codigoProducto, context) async {
  if (codigoProducto.text.isNotEmpty) {
    final response = await buscarProductoService(codigoProducto.text, context);
    if (response is ProductoBuscado) {
      final productoBusc = await 
      return response;
    } else if (response == 404) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No se encontró el producto buscado.')));
    } else if (response == 500) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Hubo un error interno en el servidor al buscar el producto.')));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Por favor ingrese un código de producto para realizar la búsqueda.')));
  }
}  */