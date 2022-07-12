import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/arqueo.model.dart';

// ignore: non_constant_identifier_names

Future mostrarArqueo() async {
  List<Arqueo> arqueos = [];
  try {
    var response = await http
        .get(Uri.parse('http://localhost:8080/api/arqueo/mostrarArqueos'));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      for (var item in jsonResponse) {
        arqueos.add(Arqueo.fromJson(item));
      }
    }
  } catch (e) {
    return e;
  }
}
