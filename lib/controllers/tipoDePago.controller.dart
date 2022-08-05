import 'package:flutter/material.dart';
import 'package:soft_frontend/models/tipoPago.model.dart';
import 'package:soft_frontend/models/unPagoBuscado.model.dart';
import 'package:soft_frontend/screens/tipoPago/editarTipoPago.screen.dart';
import '../screens/tipoPago/buscarTipoPago.screen.dart';
import '../services/tipoPago.service.dart';

//Controlador para xrear un nuevo tipo de pagoo
Future<TipoPago?> crearTipoPago_Controller(
    String tipoDePago, String descripcionTipoPago, context) async {
  if (tipoDePago.isNotEmpty && descripcionTipoPago.isNotEmpty) {
    List<Tipopago?> tipopago =
        await CrearTipoPago(tipoDePago, descripcionTipoPago, context);
    if (tipopago != null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Nuevo Tipo de pago añadido con exito")));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BuscarTipoPago(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Hubo un problema")));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Campos en blanco")));
  }
}

/*Future<void> actualizarTipoPago_Controller(String idTipoPago, String tipoDePago,
    String descripcionTipoPago, context) async {
  if (idTipoPago.isNotEmpty &&
      tipoDePago.isNotEmpty &&
      descripcionTipoPago.isNotEmpty) {
    List tipopago = await EditarTipoPago(
        idTipoPago, tipoDePago, descripcionTipoPago, context);
    if (tipopago != null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Tipo De Pago Actualizado")));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BuscarTipoPago(),
        ),
      );
    } else if (tipopago == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se actualizó el Tipo de Pago!')));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Campos en blanco")));
  }
}*/
