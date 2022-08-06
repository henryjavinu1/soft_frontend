import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/Tipoproducto.model.dart';
import 'dart:convert';
import '../constans.dart';

// ignore: non_constant_identifier_names
class FetchUser {
  String fetchurl = "";
  List<Tipoproducto> results = [];
  Future<List<Tipoproducto>> getUserList({String? query}) async {
    var data = [];
    var url = Uri.parse(API_URL + "producto/mostrartipos");
    var response = await http.get(url);
    List<Tipoproducto> users = [];
    try {
      if (response.statusCode == 200) {
        var units = (json.decode(response.body)
            as Map<String, dynamic>)["tipoProducto"];
        //results = units.map((e) => Tipoproducto.fromJson(e)).toList();
        for (var u in units) {
          Tipoproducto user = Tipoproducto(
              id: u["id"],
              tipoProducto: u["tipoProducto"],
              descripcionProducto: u["descripcionProducto"],
              isvTipoProducto: u["isvTipoProducto"]);
          users.add(user);
        }
        if (query != null) {
          users = users
              .where((element) => element.tipoProducto!
                  .toLowerCase()
                  .contains(query.toLowerCase()))
              .toList();
        }
      } else {
        print('Api error');
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return users;
  }
}

Future<List<Tipoproducto>> fetchNotes2() async {
  var data = [];
  var url = Uri.parse(API_URL + "producto/mostrartipos");
  var response = await http.get(url);
  List<Tipoproducto> users = [];

  try {
    if (response.statusCode == 200) {
      var units =
          (json.decode(response.body) as Map<String, dynamic>)["tipoProducto"];
      for (var u in units) {
        Tipoproducto user = Tipoproducto(
            id: u["id"],
            tipoProducto: u["tipoProducto"],
            descripcionProducto: u["descripcionProducto"],
            isvTipoProducto: u["isvTipoProducto"]);
        users.add(user);
      }
    } else {
      print('Api error');
    }
  } on Exception catch (e) {
    print('error: $e');
  }
  return users;
}

Future<void> crearTipoProducto(String tipoProducto, String descripcionProducto,
    String isvTipoProducto, context) async {
  if (tipoProducto.isNotEmpty &&
      descripcionProducto.isNotEmpty &&
      isvTipoProducto.isNotEmpty) {
    var response =
        await http.post(Uri.parse(API_URL + "producto/tipoproducto/"),
            body: ({
              'tipoProducto': tipoProducto,
              'descripcionProducto': descripcionProducto,
              'isvTipoProducto': isvTipoProducto,
            }));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Tipo de producto creado exitosamente.")));
    } else {}
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al crear el tipo de producto.")));
  }
}

Future<void> ActualizarTipoProducto(String idTipoProducto, String tipoProducto,
    String descripcionProducto, String isvTipoProducto, context) async {
  if (idTipoProducto.isNotEmpty &&
      tipoProducto.isNotEmpty &&
      descripcionProducto.isNotEmpty &&
      isvTipoProducto.isNotEmpty) {
    var response =
        await http.post(Uri.parse(API_URL + "producto/actualizartipo/"),
            body: ({
              'id': idTipoProducto,
              'tipoProducto': tipoProducto,
              'descripcionProducto': descripcionProducto,
              'isvTipoProducto': isvTipoProducto
            }));

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Tipo de Producto Actualizado.")));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al actualizar tipo de Producto")));
  }
}

Future<void> EliminarTipoProducto(String idTipoProducto, context) async {
  var response = await http.post(Uri.parse(API_URL + "producto/eliminartipo"),
      body: ({
        'id': idTipoProducto,
      }));

  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Tipo de Producto eliminado.")));
  }
}

Future<List<Tipoproducto>> obtenerTipos() async {
  var data = [];
  var url = Uri.parse(API_URL + "producto/mostrartipos");
  var response = await http.get(url);
  List<Tipoproducto> users = [];

  try {
    if (response.statusCode == 200) {
      var units =
          (json.decode(response.body) as Map<String, dynamic>)["tipoProducto"];
      for (var u in units) {
        Tipoproducto user = Tipoproducto(
            id: u["id"],
            tipoProducto: u["tipoProducto"],
            descripcionProducto: u["descripcionProducto"],
            isvTipoProducto: u["isvTipoProducto"]);
        users.add(user);
      }
    } else {
      print('Api error');
    }
  } on Exception catch (e) {
    print('error: $e');
  }
  return users;
}
