import 'package:flutter/material.dart';
import '../models/arqueo.model.dart';
import '../services/arqueo.service.dart';

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
