import 'dart:js';

import 'package:flutter/material.dart';
import 'package:soft_frontend/models/arqueo.model.dart';
import '../models/arqueo.model.dart';
import '../services/Arqueo.service.dart';

Future<ManipularArqueo?> eliminarArqueo_Controller(
    String idArqueo, context) async {
  List<ManipularArqueo?> arq = await eliminarArqueo(idArqueo);
  print(idArqueo);
  // ignore: unnecessary_null_comparison
  if (arq != null) {
    Navigator.pushNamed(context, 'traer_arqueo');
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Arqueo eliminado con exito')));
  } else {}
}

Future<ManipularArqueo?> crearArqueo_Controller(
    String idSesion, String idUsuario, String efectivoApertura, context) async {
  if (idSesion.isNotEmpty &&
      idUsuario.isNotEmpty &&
      efectivoApertura.isNotEmpty) {
    List<ManipularArqueo?> arqueo =
        await crearArqueo(idSesion, idUsuario, efectivoApertura);
    if (arqueo != null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Arqueo Creado con exito")));
      Navigator.pushNamed(context, "traer_arqueo");
    } else {}
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Campos en blanco")));
  }
}

Future<ManipularArqueo?> actualizarArqueoCerrandoSesion_Controller(
    String idUsuario, String idSesion, String idArqueo, context) async {
  if (idUsuario.isNotEmpty && idSesion.isNotEmpty && idArqueo.isNotEmpty) {
    List<ManipularArqueo?> arqueo =
        await actualizarArqueoCerrandoSesion(idUsuario, idSesion, idArqueo);
    if (arqueo != null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Arqueo Actualizado con exito")));
      Navigator.pushNamed(context, "traer_arqueo");
    } else {}
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Campos en blanco")));
  }
}
