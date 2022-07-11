import 'dart:convert';
import 'package:soft_frontend/models/models.dart';

class Arqueo {
  Arqueo({
    required this.id,
    required this.idSesion,
    required this.idUsuario,
    required this.efectivoApertura,
  });
  int id;
  int idSesion;
  int idUsuario;
  double efectivoApertura;

  factory Arqueo.fromJson(String str) => Arqueo.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());
  factory Arqueo.fromMap(Map<String, dynamic> json) => Arqueo(
        id: json["id"],
        idSesion: json["idSesion"],
        idUsuario: json["idUsuario"],
        efectivoApertura: json["efectivoApertura"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "idSesion": idSesion,
        "idUsuario": idUsuario,
        "efectivoApertura": efectivoApertura,
      };
}
