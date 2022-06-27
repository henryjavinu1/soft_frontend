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
    String rol = user.rol.rol;
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
                if (rol == "root") ...[
                  Visibility(
                      visible: true,
                      child: TextButtons(
                        argument: response,
                        name: "Módulo de Mantenimiento",
                        route: 'mantenimiento',
                        width: 0.8,
                        fontSize: 15,
                      )),
                ],
                const SizedBox(
                  height: 30,
                ),
                TextButtons(
                  argument: response,
                  name: "Módulo de Ventas",
                  route: 'mantenimiento',
                  width: 0.8,
                  fontSize: 15,
                ),
                const SizedBox(
                  height: 30,
                ),
                if (rol == "root") ...[
                  Visibility(
                      visible: true,
                      child: TextButtons(
                        argument: response,
                        name: "Módulo de Inventario",
                        route: 'mantenimiento',
                        width: 0.8,
                        fontSize: 15,
                      )),
                ],
                const SizedBox(
                  height: 30,
                ),
                if (rol == "root") ...[
                  Visibility(
                      visible: true,
                      child: TextButtons(
                        argument: response,
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
                    argument: response,
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
