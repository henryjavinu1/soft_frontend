import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/constans.dart';
import 'package:soft_frontend/models/mostrarArqueo.model.dart';
import 'package:soft_frontend/models/manipularArqueos.dart';

// ignore: non_constant_identifier_names

Future<List<MostrarArqueo>> traerArqueos() async {
  List<MostrarArqueo> ArqueosVacio = [];
  try {
    var response = await http.get(Uri.parse(API_URL + 'arqueo/mostrarArqueo'));
    if (response.statusCode == 200) {
      final arqueos = manipularArqueoFromJson(response.body);
      return arqueos.arqueoss;
    } else {
      return ArqueosVacio;
    }
  } catch (e) {
    return ArqueosVacio;
  }
}
