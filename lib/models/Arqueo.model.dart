class Arqueo {
  int idUsuario;
  int idSesion;
  double efectivoApertura;
  Arqueo({
    required this.idUsuario,
    required this.idSesion,
    required this.efectivoApertura,
  });
  Arqueo.fromJson(Map<String, dynamic> json)
      : idUsuario = json["idUsuario"],
        idSesion = json["idSesion"],
        efectivoApertura = json["efectivoApertura"];
}
