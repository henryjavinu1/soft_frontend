import 'dart:convert';

Arqueo mostrarArqueoFromJson(String str) => Arqueo.fromJson(json.decode(str));

String mostrarArqueoToJson(Arqueo data) => json.encode(data.toJson());

class Arqueo {
  Arqueo({
    required this.id,
    required this.fechaInicio,
    required this.fechaFinal,
    required this.efectivoApertura,
    required this.efectivoCierre,
    required this.otrosPagos,
    required this.ventaCredito,
    required this.ventaTotal,
    required this.efectivoTotal,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.idUsuario,
    required this.idSesion,
  });

  int id;
  DateTime fechaInicio;
  DateTime fechaFinal;
  double efectivoApertura;
  double efectivoCierre;
  double otrosPagos;
  double ventaCredito;
  double ventaTotal;
  double efectivoTotal;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int idUsuario;
  int idSesion;

  factory Arqueo.fromJson(Map<String, dynamic> json) => Arqueo(
        id: json["id"],
        fechaInicio: DateTime.parse(json["fecha_inicio"]),
        fechaFinal: DateTime.parse(json["fecha_final"]),
        efectivoApertura: json["efectivo_apertura"].toDouble(),
        efectivoCierre: json["efectivo_cierre"].toDouble(),
        otrosPagos: json["otros_pagos"].toDouble(),
        ventaCredito: json["venta_credito"].toDouble(),
        ventaTotal: json["venta_total"].toDouble(),
        efectivoTotal: json["efectivo_total"].toDouble(),
        isDeleted: json["is_deleted"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        idUsuario: json["id_usuario"],
        idSesion: json["id_sesion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fecha_inicio": fechaInicio.toIso8601String(),
        "fecha_final": fechaFinal.toIso8601String(),
        "efectivo_apertura": efectivoApertura,
        "efectivo_cierre": efectivoCierre,
        "otros_pagos": otrosPagos,
        "venta_credito": ventaCredito,
        "venta_total": ventaTotal,
        "efectivo_total": efectivoTotal,
        "is_deleted": isDeleted,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "id_usuario": idUsuario,
        "id_sesion": idSesion,
      };
}
