import 'dart:convert';
import 'dart:js_util';
import 'package:flutter/material.dart';
import '../models/arqueo.model.dart';
import '../services/arqueo.service.dart';

Future<ManipularArqueo?> eliminarArqueo_Controller(
    String idArqueo, context) async {
  List<ManipularArqueo?> arq = await eliminarArqueo(idArqueo);
  print(idArqueo);
  if (arq != null) {
    Navigator.pushNamed(context, "traerArqueos");
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Arqueo eliminado con exito")));
  } else {}
}
