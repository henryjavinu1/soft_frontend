import 'dart:convert';
import 'package:soft_frontend/models/mostrarArqueo.model.dart';

ManipularArqueo manipularArqueoFromJson(String str) =>
    ManipularArqueo.fromJson(json.decode(str));

String ManipularArqueoToJson(ManipularArqueo data) =>
    json.encode(data.toJson());

class ManipularArqueo {
  ManipularArqueo({required this.arqueoss});

  List<MostrarArqueo> arqueoss;

  factory ManipularArqueo.fromJson(Map<String, dynamic> json) =>
      ManipularArqueo(
        arqueoss: List<MostrarArqueo>.from(
            json["arqueos"].map((x) => MostrarArqueo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "arqueos": List<dynamic>.from(arqueoss.map((x) => x.toJson())),
      };
}
