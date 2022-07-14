import 'dart:convert';
import 'package:soft_frontend/models/mostrarArqueo.model.dart';

ManipularArqueo manipularArqueoFromJson(String str) =>
    ManipularArqueo.fromJson(json.decode(str));

String ManipularArqueoToJson(ManipularArqueo data) =>
    json.encode(data.toJson());

class ManipularArqueo {
  ManipularArqueo({required this.arqueoss});

  List<Arqueo> arqueoss;

  factory ManipularArqueo.fromJson(Map<String, dynamic> json) =>
      ManipularArqueo(
        arqueoss:
            List<Arqueo>.from(json["arqueos"].map((x) => Arqueo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "arqueos": List<dynamic>.from(arqueoss.map((x) => x.toJson())),
      };
}
