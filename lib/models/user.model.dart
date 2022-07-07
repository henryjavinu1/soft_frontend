class Usuario {
  String usuario;
  int id;

  Usuario({
    required this.id,
    required this.usuario,
  });

  Usuario.fromJson(Map<String, dynamic> json)
      : usuario = json["usuario"],
        id = json["id"];
}
