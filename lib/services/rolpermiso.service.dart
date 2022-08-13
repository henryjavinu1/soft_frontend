import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/constans.dart';
import 'package:soft_frontend/models/models.dart';



  RolesPermisos? rolPermiso = null;
  List<RolesPermisos?> RolesPermisosCreado = [];
 List<String> idRol=["2","2","2","2"];
 List<String> idPermiso=["3","4","5","1"];

Future<List<RolesPermisos?>> crearRolPermiso() async {
 Map<String,String>data;
  var client = http.Client();
 final uri = API_URL + 'rolpermiso/crearrolpermiso';
   data={
    
    };
  for(int i=0;i<idRol.length;i++){
   data.addAll({"idRol":idRol[i]});
  print(data[i]);

  }
  for(int i=0;i<idPermiso.length;i++){
   data.addAll({"idPermiso":idPermiso[i]});
  print(data[i]);

  }
  try {
    var response = await http.post(Uri.parse(API_URL + 'rolpermiso/crearrolpermiso'),headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Connection':'keep-alive'
        },
        body:jsonEncode([data]));
    print(response.body);
    if (response.statusCode == 200) {
      print(RolesPermisos);
      print("PIJUDOOOO");
      //return clienteCreado;
    } else if (response.statusCode == 400) {
      print("Cagaste 400");
    } else {
      // return clienteCreado;
    }
    return RolesPermisosCreado;
  } catch (e) {
    print(e);
    return RolesPermisosCreado;
  } finally {
    http.Client().close();
  }
}
