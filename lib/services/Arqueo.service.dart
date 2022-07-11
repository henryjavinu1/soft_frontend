import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/constans.dart';
import 'package:soft_frontend/models/arqueo.model.dart';

//crear un servicio para mostra los arqueos
class ArqueoService {
  //crear una funcion para obtener los arqueos
  Future<List<ArqueoModel>> getArqueos() async {
    //crear una lista de arqueos
    List<ArqueoModel> arqueos = [];
    //crear una variable para obtener la url
    String url = API_URL + 'arqueo/mostrarArqueo';
    //crear una variable para obtener el resultado de la peticion
    var result = await http.get(url);
    //crear una variable para obtener el json
    var jsonData = jsonDecode(result.body);
    //crear una variable para obtener el status de la peticion
    var statusCode = jsonData['statusCode'];
    //crear una variable para obtener el mensaje de la peticion
    var message = jsonData['message'];
    //crear una variable para obtener los datos de la peticion
    var data = jsonData['data'];

    //si el statusCode es 200
    if (statusCode == 200) {
      //recorrer los datos
      for (var arqueo in data) {
        //crear un arqueo
        ArqueoModel arqueoModel = ArqueoModel();
        //asignar los datos al arqueo
        arqueoModel.idArqueo = arqueo['idArqueo'];
        arqueoModel.fecha = arqueo['fecha'];
        arqueoModel.monto = arqueo['monto'];
        arqueoModel.idUsuario = arqueo['idUsuario'];
        arqueoModel.idSucursal = arqueo['idSucursal'];
        //agregar el arqueo a la lista
        arqueos.add(arqueoModel);
      }
    }
  }
