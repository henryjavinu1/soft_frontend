import 'dart:convert';
import '../models/arqueo.model.dart';
import '../services/arqueo.service.dart';

Future<bool> createArqueo_controller(
    int idUsuario, int idSesion, double efectivoApertura) async {
  Arqueo? arqueo = await createArqueo(idUsuario, idSesion, efectivoApertura);
  if (arqueo != null) {
    return true;
  } else {
    return false;
  }
}
