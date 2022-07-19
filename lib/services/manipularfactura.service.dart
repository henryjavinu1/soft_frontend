import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soft_frontend/constans.dart';
import 'package:soft_frontend/models/errorPeticion.model.dart';
import 'package:soft_frontend/models/facturaBuscada.model.dart';
import 'package:soft_frontend/models/manipularFacturaResponse.dart';
import 'package:soft_frontend/models/mostrarUnaFactura.model.dart';
import 'package:soft_frontend/models/unaFacturaBuscada.model.dart';

// ignore: non_constant_identifier_names

Future traerFactura() async {
  try {
    var response = await http
        .get(Uri.parse(API_URL + 'traerFacturas'))
        .timeout(Duration(seconds: 15));

    if (response.statusCode == 200) {
      final facturas = manipularFacturaResponseFromJson(response.body);
      return facturas;
    } else if(response.statusCode == 500) {
      return 500;
    }
  } on TimeoutException catch (_) {
     throw ('Tiempo de espera alcanzado');
  } catch (e) {
    print(e);
    return 2;
  }
}

Future buscarFacturaPorNumero(String numeroFactura) async {
  try {
    var response = await http.get(
      Uri.parse(API_URL + 'buscarfactura/?numeroFactura=$numeroFactura'),
      headers: {'content-type': 'application/json'},
    ).timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      final facturaBuscada =
          UnaFacturaBuscada.fromJson(jsonDecode(response.body));
      return facturaBuscada;
    } else if (response.statusCode == 404) {
      return response.statusCode;
    }
  } catch (e) {
    print(e);
    return e;
  }
}

Future filtrarFacturasPorCliente(String nombre, String rtn, String dni) async {
  List<FacturaBuscada> facturaVacia = [];
  String url = API_URL + 'buscarfacturaporcliente/';
  try {
    if (nombre.isNotEmpty) {
      url = url + '?nombreCliente=$nombre';
    } else if (rtn.isNotEmpty) {
      url = url + '?rtn=$rtn';
    } else if (dni.isNotEmpty) {
      url = url + '?dni=$dni';
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
  String url = API_URL + 'buscarfacturaporfecha/';
  try {
    if (fecha2.isNotEmpty && fecha1.isNotEmpty) {
      url = url + '?fecha1=$fecha1&fecha2=$fecha2';
    } else if (fecha1.isNotEmpty && fecha2.isEmpty) {
      url = url + '?fecha1=$fecha1';
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
  String url = API_URL + 'buscarfacturaportalonario/';
  try {
    if (idTalonario.isEmpty && cai.isNotEmpty) {
      url = url + '?cai=$cai';
    } else {
      url = url + '?idTalonario=$idTalonario';
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

Future filtrarFacturasPorEmpleado(
  String idEmpleado,
) async {
  List<FacturaBuscada> facturaVacia = [];
  String url = API_URL + 'buscarfacturaporempleado/';
  try {
    if (idEmpleado.isNotEmpty) {
      url = url + '?idEmpleado=$idEmpleado';
    }
    print(url);
    var response = await http.get(Uri.parse(url));
    print(response.request);
    if (response.statusCode == 200) {
      final facturas = manipularFacturaResponseFromJson(response.body);
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

Future mostrarDatosDeUnaFactura(String numeroFactura) async {
  String url = 'http://localhost:8080/api/traerunafactura/';
  var response;
  if (numeroFactura.isNotEmpty) {
    url = url + '?numeroFactura=$numeroFactura';
  }
  try {
    response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final datosFactura = mostrarUnaFacturaFromJson(response.body);
      return datosFactura;
    } else if (response.statusCode == 400) {
      final error = mensajePeticionFromJson(response.body);
      return error;
    } else if (response.statusCode == 500) {
      return 'Ocurrió un error interno del servidor';
    }
  } catch (e) {
    print(e);
    return 2;
  }
}
