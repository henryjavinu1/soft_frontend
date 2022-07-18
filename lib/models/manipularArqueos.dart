import 'dart:convert';
import 'package:soft_frontend/models/mostrarArqueo.model.dart';

ManipularArqueo manipularArqueoFromJson(String str) =>
    ManipularArqueo.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
String ManipularArqueoToJson(ManipularArqueo data) =>
    json.encode(data.toJson());

class ManipularArqueo {
  ManipularArqueo({required this.arqueoss});

  List<MostrarArque> arqueoss;

  factory ManipularArqueo.fromJson(Map<String, dynamic> json) =>
      ManipularArqueo(
        arqueoss: List<MostrarArque>.from(
            json["arqueos"].map((x) => MostrarArque.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "arqueos": List<dynamic>.from(arqueoss.map((x) => x.toJson())),
      };
}
