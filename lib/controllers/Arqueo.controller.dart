import 'dart:convert';
import '../models/Arqueo.model.dart';
import '../services/Arqueo.service.dart';

Future<bool> createArqueo_controller(
    int idUsuario, int idSesion, double efectivoApertura) async {
  Arqueo? arqueo = await createArqueo(idUsuario, idSesion, efectivoApertura);
  if (arqueo != null) {
    return true;
  } else {
    return false;
  }
}
