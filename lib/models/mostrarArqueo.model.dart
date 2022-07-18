import 'dart:convert';

MostrarArque mostrarArqueoFromJson(String str) =>
    MostrarArque.fromJson(json.decode(str));

String mostrarArqueoToJson(MostrarArque data) => json.encode(data.toJson());

class MostrarArque {
  MostrarArque({
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
  double efectivoApertura;
  double efectivoCierre;
  double otrosPagos;
  double ventaCredito;
  double ventaTotal;
  double efectivoTotal;
  bool isDelete;
  DateTime createdAt;
  DateTime updatedAt;
  int idUsuario;
  int idSesion;

  factory MostrarArque.fromJson(Map<String, dynamic> json) => MostrarArque(
        idArqueo: json["idArqueo"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFinal: DateTime.parse(json["fechaFinal"]),
        efectivoApertura: json["efectivoApertura"].toDouble(),
        efectivoCierre: json["efectivoCierre"].toDouble(),
        otrosPagos: json["otrosPagos"].toDouble(),
        ventaCredito: json["ventaCredito"].toDouble(),
        ventaTotal: json["ventaTotal"].toDouble(),
        efectivoTotal: json["efectivoTotal"].toDouble(),
        isDelete: json["isDelete"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        idUsuario: json["idUsuario"],
        idSesion: json["idSesion"],
      );

  Map<String, dynamic> toJson() => {
        "idArqueo": idArqueo,
        "fechaInicio": fechaInicio.toIso8601String(),
        "fechaFinal": fechaFinal.toIso8601String(),
        "efectivoApertura": efectivoApertura,
        "efectivoCierre": efectivoCierre,
        "otrosPagos": otrosPagos,
        "ventaCredito": ventaCredito,
        "ventaTotal": ventaTotal,
        "efectivoTotal": efectivoTotal,
        "isDelete": isDelete,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "idUsuario": idUsuario,
        "idSesion": idSesion,
      };
}
