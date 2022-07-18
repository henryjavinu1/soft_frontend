import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/constans.dart';
import 'package:soft_frontend/models/arqueo.model.dart';
import 'package:soft_frontend/models/manipularArqueos.dart';
import 'package:soft_frontend/models/models.dart';

// ignore: non_constant_identifier_names
Future<List<MostrarArque>> traerArqueos() async {
  List<MostrarArque> ArqueosVacio = [];
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
