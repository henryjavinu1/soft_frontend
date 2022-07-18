import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/constans.dart';
import 'package:soft_frontend/models/mostrarArqueo.model.dart';
import 'package:soft_frontend/models/manipularArqueos.dart';
import 'package:soft_frontend/models/models.dart';

// ignore: non_constant_identifier_names
<<<<<<< HEAD
Future<List<MostrarArque>> traerArqueos() async {
  List<MostrarArque> ArqueosVacio = [];
=======

Future mostrarArqueo() async {
  List<Arqueo> arqueos = [];
>>>>>>> 04bed23b273ac1223ea4b2b34ee716c0ba0e414a
  try {
    var response = await http.get(Uri.parse(API_URL + 'arqueo/mostrarArqueo'));
    if (response.statusCode == 200) {
      final listaArque = manipularArqueoFromJson(response.body);
      return listaArque.arqueoss;
    } else {
      return ArqueosVacio;
    }
  } catch (e) {
    return ArqueosVacio;
  }
}

Future<MostrarArque?> buscarArqueoPorIdUsuario(String idUsuario) async {
  MostrarArque? arqueo = null;
  try {
    var response =
        await http.post(Uri.parse(API_URL + 'arqueo/buscarPorUsuario'),
            body: ({
              'idUsuario': idUsuario,
            }));
    print(response.body.toString());
    if (response.statusCode == 200) {
      final arqueos = mostrarArqueoFromJson(response.body);
      return arqueos;
    } else {
      return arqueo;
    }
  } catch (e) {
    return arqueo;
  }
}
