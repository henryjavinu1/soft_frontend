// To parse this JSON data, do
//
//     final manipularArqueo = manipularArqueoFromJson(jsonString);
import 'dart:convert';

ManipularArqueo manipularArqueoFromJson(String str) =>
    ManipularArqueo.fromJson(json.decode(str));
String manipularArqueoToJson(ManipularArqueo data) =>
    json.encode(data.toJson());

class ManipularArqueo {
  ManipularArqueo({
    required this.arqueos,
  });

  List<Arqueo> arqueos;

  factory ManipularArqueo.fromJson(Map<String, dynamic> json) =>
      ManipularArqueo(
        arqueos:
            List<Arqueo>.from(json['arqueos'].map((x) => Arqueo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'arqueos': List<dynamic>.from(arqueos.map((x) => x.toJson())),
      };
}

class Arqueo {
  Arqueo({
    required this.idArqueo,
    required this.fechaInicio,
    required this.fechaFinal,
    required this.efectivoApertura,
    required this.efectivoCierre,
    required this.otrosPagos,
    required this.ventaCredito,
    required this.ventaTotal,
    required this.efectivoTotal,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
    required this.idUsuario,
    required this.idSesion,
  });

  int idArqueo;
  DateTime fechaInicio;
  DateTime fechaFinal;
  String efectivoApertura;
  String efectivoCierre;
  String otrosPagos;
  String ventaCredito;
  String ventaTotal;
  String efectivoTotal;
  bool isDelete;
  DateTime createdAt;
  DateTime updatedAt;
  int idUsuario;
  int idSesion;

  factory Arqueo.fromJson(Map<String, dynamic> json) => Arqueo(
        idArqueo: json['idArqueo'],
        fechaInicio: DateTime.parse(json['fechaInicio']),
        fechaFinal: DateTime.parse(json['fechaFinal']),
        efectivoApertura: json['efectivoApertura'],
        efectivoCierre: json['efectivoCierre'],
        otrosPagos: json['otrosPagos'],
        ventaCredito: json['ventaCredito'],
        ventaTotal: json['ventaTotal'],
        efectivoTotal: json['efectivoTotal'],
        isDelete: json['isDelete'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        idUsuario: json['idUsuario'],
        idSesion: json['idSesion'],
      );

  Map<String, dynamic> toJson() => {
        'idArqueo': idArqueo == null ? null : idArqueo,
        'fechaInicio': fechaInicio.toIso8601String(),
        'fechaFinal': fechaFinal.toIso8601String(),
        'efectivoApertura': efectivoApertura,
        'efectivoCierre': efectivoCierre,
        'otrosPagos': otrosPagos,
        'ventaCredito': ventaCredito,
        'ventaTotal': ventaTotal,
        'efectivoTotal': efectivoTotal,
        'isDelete': isDelete,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'idUsuario': idUsuario,
        'idSesion': idSesion,
      };
}
