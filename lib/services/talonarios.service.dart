import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soft_frontend/screens/talonarios/models/talonarios_response.dart';

// ignore: non_constant_identifier_names

Future<List<Talonario>> getTalonarios() async {
  List<Talonario> talonarios = [];
  try {
    var response =
        await http.get(Uri.parse("http://localhost:8080/api/talonarios/get"));
    if (response.statusCode == 200) {
      final decode = TalonariosResponse.fromJson(response.body);
      print(decode.talonarios!);
      print(decode.talonarios![0].idTalonario);
      return decode.talonarios!;
    } else {
      // print(response.statusCode);
      return talonarios;
    }
  } catch (e) {
    // print(e);
    return talonarios;
  }
}

Future<String> deleteTalonario(idTalonario) async {
  print('entra');
  String resp = "";
  try {
    var response = await http.get(Uri.parse(
        "http://localhost:8080/api/talonarios/delete?idTalonario=" +
            idTalonario));

    print(response.body);
    if (response.statusCode == 200) {
      final decode = json.decode(response.body);
      resp = decode;
    } else {
      resp = 'Error';
    }
    return resp;
  } catch (e) {
    print(e);
    return e.toString();
  }
}
