import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/sucursal.model.dart';

import '../constans.dart';

Future<Sucursal> getSucursal(idSucursal) async {
  Sucursal resp = Sucursal(
      sucursal: DetalleSucursal(
          nombreSucursal: '',
          lemaSucursal: '',
          idSucursal: 0,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now()));
  try {
    var response = await http.post(Uri.parse(API_URL + "sucursales/get"),
        body: ({'idSucursal': idSucursal.toString()}));
    print(response.body);
    if (response.statusCode == 200) {
      final decode = Sucursal.fromJson(response.body);
      print(decode);
      resp.sucursal = decode.sucursal;

      return resp;
    } else {
      print('b');
      return resp;
    }
  } catch (e) {
    return resp;
  }
}

Future<String> updateSucursal(idSucursal, nombre, lema) async {
  String resp = '';
  try {
    var response = await http.post(Uri.parse(API_URL + "sucursales/update"),
        body: ({
          'idSucursal': idSucursal.toString(),
          'nombreSucursal': nombre,
          'lemaSucursal': lema
        }));
    print(response.body);
    if (response.statusCode == 200) {
      return resp = 'Guardado con éxito.';
    } else {
      print('b');
      return resp = 'Error.';
    }
  } catch (e) {
    return resp = 'Error.';
  }
}
