// To parse this JSON data, do
//
//     final unaFacturaBuscada = unaFacturaBuscadaFromJson(jsonString);

import 'dart:convert';

import 'package:soft_frontend/models/facturaBuscada.model.dart';

UnaFacturaBuscada unaFacturaBuscadaFromJson(String str) => UnaFacturaBuscada.fromJson(json.decode(str));

String unaFacturaBuscadaToJson(UnaFacturaBuscada data) => json.encode(data.toJson());

class UnaFacturaBuscada {
    UnaFacturaBuscada({
        required this.facturaBuscada,
    });

    FacturaBuscada facturaBuscada;

    factory UnaFacturaBuscada.fromJson(Map<String, dynamic> json) => UnaFacturaBuscada(
        facturaBuscada: FacturaBuscada.fromJson(json["facturaBuscada"]),
    );

    Map<String, dynamic> toJson() => {
        "facturaBuscada": facturaBuscada.toJson(),
    };
}

