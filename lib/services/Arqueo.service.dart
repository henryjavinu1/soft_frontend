import 'dart:convert';
import 'dart:developer';
import '../models/Arqueo.model.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/constans.dart';

Future<Arqueo?> createArqueo(
    int idUsuario, int idSesion, double efectivoApertura) async {
  var arque = http.Client();
  Arqueo? arqueo = null;
  try {
    var response =
        await arque.post(Uri.parse(API_URL + "arqueo/createArqueo"), body: {
      'idUsuario': idUsuario,
      'idSesion': idSesion,
      'efectivoApertura': efectivoApertura
    });
    if (response.statusCode == 200) {
      Arqueo arqueo = Arqueo.fromJson(json.decode(response.body));
      log(arqueo.toString());
      return arqueo;
    } else {
      return arqueo;
    }
  } finally {
    arque.close();
  }
}
