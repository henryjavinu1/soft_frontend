import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soft_frontend/models/errorPeticion.model.dart';
import 'package:soft_frontend/models/facturaBuscada.model.dart';
import 'package:soft_frontend/models/manipularFacturaResponse.dart';
import 'package:soft_frontend/models/unaFacturaBuscada.model.dart';

// ignore: non_constant_identifier_names

Future<List<FacturaBuscada>> traerFactura() async {
  List<FacturaBuscada> facturaVacia = [];
  try {
    var response = await http.get(Uri.parse("http://localhost:8080/api/traerFacturas"));
    if (response.statusCode == 200) {
      // print(response.request);
      // print(jsonDecode(response.body));
      // print(response.statusCode);
      
      final facturas = manipularFacturaResponseFromJson(response.body);
      // print(facturas.facturas);
      return facturas.facturas;
    }else { 
      // print(response.statusCode);
      return facturaVacia;
    }
  } catch (e) {
    // print(e);
    return facturaVacia;
  }
}

Future buscarFacturaPorNumero(String numeroFactura) async {
  try {
    var response = await http.get(Uri.parse("http://localhost:8080/api/buscarfactura/?numeroFactura=${numeroFactura}"), 
    headers: {  'content-type': 'application/json' },);
    if (response.statusCode == 200) {
      // print(response.request);
      // print(jsonDecode(response.body));
      // print(response.statusCode);
      final facturaBuscada = UnaFacturaBuscada.fromJson(jsonDecode(response.body));
      // final factura = unaFacturaBuscadaFromJson(response.body);
      // print('Minutos;: ${facturaBuscada.unafactura.cantidadLetras}');
      return facturaBuscada;
    }else if (response.statusCode == 404) { 
      // print(response.statusCode);
      return response.statusCode;
    }
  } catch (e) {
    print(e);
    return e;
  }
}

Future filtrarFacturasPorCliente(String nombre, String rtn, String dni) async {
  List<FacturaBuscada> facturaVacia = [];
  String url = 'http://localhost:8080/api/buscarfacturaporcliente/';
  try {
    if (nombre.isNotEmpty) {
      url = url+'?nombreCliente=$nombre';
    } else if (rtn.isNotEmpty) {
      url = url+'?rtn=$rtn';
    } else if (dni.isNotEmpty) {
      url = url+'?dni=$dni';
    }
    print(url);
    var response = await http.get(Uri.parse(url));
    print(response.request);
    if (response.statusCode == 200) {
      final facturas = manipularFacturaResponseFromJson(response.body);
      print(facturas.facturas);
      return facturas.facturas;
    } else if (response.statusCode == 404) {
      return response.statusCode;
    } else if (response.statusCode == 400) {
      print(response.statusCode);
      final error = mensajePeticionFromJson(response.body);
      print(error);
      return error; 
    }
    return facturaVacia;
  } catch (e) {
    print(e);
    return facturaVacia;
  }
}

Future filtrarFacturasPorFecha(String fecha1, String fecha2) async {
  List<FacturaBuscada> facturaVacia = [];
  String url = 'http://localhost:8080/api/buscarfacturaporfecha/';
  try {
    if (fecha2.isNotEmpty && fecha1.isNotEmpty) {
      url = url+'?fecha1=$fecha1&fecha2=$fecha2';
    } else if (fecha1.isNotEmpty && fecha2.isEmpty) {
      url = url+'?fecha1=$fecha1';
    } 
    print(url);
    var response = await http.get(Uri.parse(url));
    print(response.request);
    if (response.statusCode == 200) {
      final facturas = manipularFacturaResponseFromJson(response.body);
      print(facturas.facturas);
      return facturas.facturas;
    } else if (response.statusCode == 404) {
      return response.statusCode;
    } else if (response.statusCode == 400) {
      print(response.statusCode);
      final error = mensajePeticionFromJson(response.body);
      print(error);
      return error; 
    }
    return facturaVacia;
  } catch (e) {
    print(e);
    return facturaVacia;
  }
}

Future filtrarFacturasPorTalonario(String idTalonario, String cai) async {
  List<FacturaBuscada> facturaVacia = [];
  String url = 'http://localhost:8080/api/buscarfacturaportalonario/';
  try {
    if (idTalonario.isEmpty && cai.isNotEmpty) {
      url = url+'?cai=$cai';
    } else {
      url = url+'?idTalonario=$idTalonario';
    } 
    print(url);
    var response = await http.get(Uri.parse(url));
    print(response.request);
    if (response.statusCode == 200) {
      final facturas = manipularFacturaResponseFromJson(response.body);
      print(facturas.facturas);
      return facturas.facturas;
    } else if (response.statusCode == 404) {
      return response.statusCode;
    } else if (response.statusCode == 400) {
      print(response.statusCode);
      final error = mensajePeticionFromJson(response.body);
      print(error);
      return error; 
    }
    return facturaVacia;
  } catch (e) {
    print(e);
    return facturaVacia;
  }
}

Future filtrarFacturasPorEmpleado(String idEmpleado,) async {
  List<FacturaBuscada> facturaVacia = [];
  String url = 'http://localhost:8080/api/buscarfacturaporempleado/';
  try {
    if(idEmpleado.isNotEmpty) {
      url = url+'?idEmpleado=$idEmpleado';
    } 
    print(url);
    var response = await http.get(Uri.parse(url));
    print(response.request);
    if (response.statusCode == 200) {
      final facturas = manipularFacturaResponseFromJson(response.body);
      print(facturas.facturas);
      return facturas.facturas;
    } else if (response.statusCode == 404) {
      return response.statusCode;
    } else if (response.statusCode == 400) {
      print(response.statusCode);
      final error = mensajePeticionFromJson(response.body);
      print(error);
      return error; 
    }
    return facturaVacia;
  } catch (e) {
    print(e);
    return facturaVacia;
  }
}

