// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:soft_frontend/controllers/user.controller.dart';
import 'package:soft_frontend/models/models.dart';
import 'package:soft_frontend/widgets/textButton.widget.dart';

class PantallaPrincipalMovil extends StatelessWidget {
  const PantallaPrincipalMovil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Object? response = ModalRoute.of(context)!.settings.arguments;
    User user = User.fromJson(response.toString());
    List<Permiso> rol = user.rol.permisos;

    final permisos = <String>[];
    for (var permiso in rol) {
      permisos.add(permiso.permiso);
    }
    return FutureBuilder<User>(
      future: usercontroller(),
         builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else{
          return Center(child: PantallaMovil(size: size, user: snapshot.data));

          }
  });
  }
}

class PantallaMovil extends StatelessWidget {
  const PantallaMovil({
    required this.size, required this.user
  });
  final User? user;
  final Size size;

  @override
  Widget build(BuildContext context) {
      
  final int? cantidadPermisos = user?.rol.permisos.length;
  final List <int?> permisosId = <int>[];

  for (int i = 0; i < cantidadPermisos!; i++) {
    permisosId.add(user?.rol.permisos[i].id);
  }
  for (int i = 0; i < cantidadPermisos; i++) {
    print(permisosId[i]);
  }
    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: size.width,
          color: const Color(0xffF3F3F3),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Panel Principal",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                if (permisosId.contains(1)) ...[
                  Visibility(
                      visible: true,
                      child: TextButtons(
                        name: "Módulo de Mantenimiento",
                        route: 'mantenimiento',
                        width: 0.8,
                        fontSize: 15,
                      )),
                ],
                const SizedBox(
                  height: 30,
                ),
                if (permisosId.contains("Modulo de Ventas")) ...[
                  Visibility(
                    visible: true,
                    child: TextButtons(
                      name: "Módulo de Ventas",
                      route: 'mantenimiento',
                      width: 0.8,
                      fontSize: 15,
                    ),
                  ),
                ],
                const SizedBox(
                  height: 30,
                ),
                if (permisosId.contains("Modulo de Inventario")) ...[
                  Visibility(
                      visible: true,
                      child: TextButtons(
                        name: "Módulo de Inventario",
                        route: 'mantenimiento',
                        width: 0.8,
                        fontSize: 15,
                      )),
                ],
                const SizedBox(
                  height: 30,
                ),
                if (permisosId.contains("Gestion de Usuarios")) ...[
                  Visibility(
                      visible: true,
                      child: TextButtons(
                        name: "Gestión de Usuarios",
                        route: 'mantenimiento',
                        width: 0.8,
                        fontSize: 15,
                      )),
                ],
                const SizedBox(
                  height: 100,
                ),
                TextButtons(
                    name: 'Cerrar Sesión',
                    route: 'login',
                    width: 0.8,
                    fontSize: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
