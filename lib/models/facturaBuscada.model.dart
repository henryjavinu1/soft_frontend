// To parse this JSON data, do
//
//     final facturaBuscada = facturaBuscadaFromJson(jsonString);

import 'dart:convert';

FacturaBuscada facturaBuscadaFromJson(String str) => FacturaBuscada.fromJson(json.decode(str));

String facturaBuscadaToJson(FacturaBuscada data) => json.encode(data.toJson());

class FacturaBuscada {
    FacturaBuscada({
        required this.idFactura,
        required this.numeroFactura,
        required this.fechaFactura,
        required this.descuentoTotalFactura,
        required this.isvTotalFactura,
        required this.totalFactura,
        required this.subTotalFactura,
        required this.cantidadLetras,
        required this.idEmpleado,
        required this.nombreEmpleado,
        required this.tipoPago,
        required this.cai,
        required this.nombreCliente,
        required this.rtn,
        required this.direccionCliente,
        required this.telefonoCliente,
    });

    int idFactura;
    int numeroFactura;
    DateTime fechaFactura;
    String descuentoTotalFactura;
    String isvTotalFactura;
    String totalFactura;
    String subTotalFactura;
    String cantidadLetras;
    int idEmpleado;
    String nombreEmpleado;
    String tipoPago;
    String cai;
    String nombreCliente;
    String rtn;
    String direccionCliente;
    String telefonoCliente;

    factory FacturaBuscada.fromJson(Map<String, dynamic> json) => FacturaBuscada(
        idFactura: json["idFactura"],
        numeroFactura: json["numeroFactura"],
        fechaFactura: DateTime.parse(json["fechaFactura"]),
        descuentoTotalFactura: json["descuentoTotalFactura"] == null ? "0.00" : json["descuentoTotalFactura"],
        isvTotalFactura: json["isvTotalFactura"] == null ? "0.00" : json["isvTotalFactura"],
        totalFactura: json["totalFactura"] == null ? "0.00" : json["totalFactura"],
        subTotalFactura: json["subTotalFactura"] == null ? "0.00" : json["subTotalFactura"],
        cantidadLetras: json["cantidadLetras"] == null ? "0.00" : json["cantidadLetras"],
        idEmpleado: json["idEmpleado"] == null ? "0.00" : json["idEmpleado"],
        nombreEmpleado: json["nombreEmpleado"] == null ? "0.00" : json["nombreEmpleado"],
        tipoPago: json["tipoPago"],
        cai: json["cai"],
        nombreCliente: json["nombreCliente"],
        rtn: json["rtn"],
        direccionCliente: json["direccionCliente"],
        telefonoCliente: json["telefonoCliente"],
    );

    Map<String, dynamic> toJson() => {
        "idFactura": idFactura,
        "numeroFactura": numeroFactura,
        "fechaFactura": "${fechaFactura.year.toString().padLeft(4, '0')}-${fechaFactura.month.toString().padLeft(2, '0')}-${fechaFactura.day.toString().padLeft(2, '0')}",
        "descuentoTotalFactura": descuentoTotalFactura,
        "isvTotalFactura": isvTotalFactura,
        "totalFactura": totalFactura,
        "subTotalFactura": subTotalFactura,
        "cantidadLetras": cantidadLetras,
        "idEmpleado": idEmpleado,
        "nombreEmpleado": nombreEmpleado,
        "tipoPago": tipoPago,
        "cai": cai,
        "nombreCliente": nombreCliente,
        "rtn": rtn,
        "direccionCliente": direccionCliente,
        "telefonoCliente": telefonoCliente,
    };
}
