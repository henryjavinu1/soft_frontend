import 'package:flutter/material.dart';
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
                if (permisos.contains("Modulo de Mantenimiento")) ...[
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
                if (permisos.contains("Modulo de Ventas")) ...[
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
                if (permisos.contains("Modulo de Inventario")) ...[
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
                if (permisos.contains("Gestion de Usuarios")) ...[
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
