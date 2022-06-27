import 'package:flutter/material.dart';


import '../../models/models.dart';
import '../../widgets/widgets.dart';

class PantallaPrincipalDesktop extends StatefulWidget {
  const PantallaPrincipalDesktop({Key? key}) : super(key: key);

  @override
  State<PantallaPrincipalDesktop> createState() => _PantallaPrincipalDesktopState();
}

class _PantallaPrincipalDesktopState extends State<PantallaPrincipalDesktop> {
  @override
  Widget build(BuildContext context) {
    Object? response = ModalRoute.of(context)!.settings.arguments;
    User user = User.fromJson(response.toString());
    String rol = user.rol.rol;
    return Scaffold(
      body: Container(
        color: const Color(0xffF3F3F3),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Panel Principal",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 40,
                ),
                TextButtons(
                  argument: response,
                  name: "Cerrar Sesión",
                  route: 'login',
                  width: 0.2, fontSize: 22,
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (rol == "root") ...[
                  Visibility(
                      visible: true,
                      child: TextButtons(
                        argument: response,
                        name: "Módulo de Mantenimiento",
                        route: 'mantenimiento',
                        width: 0.3, fontSize: 22,
                      )),
                ],
                const SizedBox(
                  width: 30,
                ),
                TextButtons(
                  argument: response,
                  name: "Módulo de Ventas",
                  route: 'mantenimiento',
                  width: 0.3, fontSize: 22,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            if (rol == "root") ...[
              Visibility(
                visible: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButtons(
                      argument: response,
                      name: "Módulo de Inventario",
                      route: 'mantenimiento',
                      width: 0.3, fontSize: 22,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    TextButtons(
                      argument: response,
                      name: "Gestión de Usuarios",
                      route: 'mantenimiento',
                      width: 0.3, fontSize: 22,
                    ),
                  ],
                ),
              )
            ]
          ]),
        ),
      ),
    );
  }
}
