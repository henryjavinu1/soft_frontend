import 'dart:convert';
import 'package:soft_frontend/models/models.dart';

class Arqueo {
  Arqueo({
    required this.id,
    required this.idSesion,
    required this.efectivoApertura,
  });
  int id;
  int idSesion;
  double efectivoApertura;

  factory Arqueo.fromJson(String str) => Arqueo.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());
  factory Arqueo.fromMap(Map<String, dynamic> json) => Arqueo(
        id: json["id"],
        idSesion: json["idSesion"],
        efectivoApertura: json["efectivoApertura"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "idSesion": idSesion,
        "efectivoApertura": efectivoApertura,
      };
}
