import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/constans.dart';
import 'package:soft_frontend/models/models.dart';

// ignore: non_constant_identifier_names
Future traerArqueos() async {
  try {
    final response = await http
        .post(Uri.parse(API_URL + 'arqueo/mostrarArqueo')); ///////////////
    if (response.statusCode == 200) {
      // print(response.request);
      //print(jsonDecode(response.body));
      ManipularArqueo listaArq = manipularArqueoFromJson(response.body);
      return listaArq;
    }
  } catch (e) {}
}

Future buscarArqueoPorIdUsuario(String idUsuario) async {
  if (idUsuario.isNotEmpty) {
    var response = await http.post(
        Uri.parse(API_URL + 'arqueo/buscarPorUsuario'),
        body: ({'idUsuario': idUsuario}));

    if (response.statusCode == 200) {
      ManipularArqueo arqueo = manipularArqueoFromJson(response.body);
    }
  }
}

Future<List<ManipularArqueo?>> eliminarArqueo(String idArqueo) async {
  print(idArqueo);
  var client = http.Client();
  ManipularArqueo? arqueo = null;
  List<ManipularArqueo> arqueoEliminado = [];
  try {
    var response = await http.post(Uri.parse(API_URL + 'arqueo/deleteArqueo'),
        body: ({
          'idArqueo': idArqueo,
        }));
    print(response.body);
    if (response.statusCode == 200) {
      print(Arqueo);
    } else {}
    return arqueoEliminado;
  } catch (e) {
    print(e);
    return arqueoEliminado;
  } finally {
    http.Client().close();
  }
}

Future<List<ManipularArqueo?>> crearArqueo(
    String idSesion, String idUsuario, String efectivoApertura) async {
  var client = http.Client();
  ManipularArqueo? arqueo = null;
  List<ManipularArqueo> arqueoCreado = [];
  try {
    var response = await http.post(Uri.parse(API_URL + 'arqueo/createArqueo'),
        body: ({
          'idSesion': idSesion,
          'idUsuario': idUsuario,
          'efectivoApertura': efectivoApertura,
        }));
    print(response.body);
    if (response.statusCode == 200) {
      print(ManipularArqueo);
    } else {
      //return arqueoCreado;
    }
    return arqueoCreado;
  } catch (e) {
    return arqueoCreado;
  } finally {
    http.Client().close();
  }
}

Future<List<ManipularArqueo?>> actualizarArqueoCerrandoSesion(
    String idUsuario, String idSesion, String idArqueo) async {
  var client = http.Client();
  ManipularArqueo? arqueo1 = null;
  List<ManipularArqueo> arqueoActualizado = [];

  try {
    var response = await http.put(
        Uri.parse(API_URL + 'arqueo/actualizacionCerrandoSesion'),
        body: ({
          'idUsuario': idUsuario,
          'idSesion': idSesion,
          'idArqueo': idArqueo,
        }));
    print(response.body);
    if (response.statusCode == 200) {
      print(ManipularArqueo);
    } else {
      //return arqueoCreado;
    }
    return arqueoActualizado;
  } catch (e) {
    return arqueoActualizado;
  } finally {
    http.Client().close();
  }
}
