import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/screens/screens.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soft_frontend/services/sharepreference.service.dart';

class PantallaPrincipalDesktop extends StatefulWidget {
  const PantallaPrincipalDesktop({Key? key}) : super(key: key);

  @override
  State<PantallaPrincipalDesktop> createState() =>
      _PantallaPrincipalDesktopState();
}

class _PantallaPrincipalDesktopState extends State<PantallaPrincipalDesktop> {
  Object? finalresponse;

  @override
  Widget build(BuildContext context) {
    getDatos();
    Size size = MediaQuery.of(context).size;
    User user = User.fromJson(finalresponse.toString());
    List<Permiso> rol = user.rol.permisos;
    final permisos = <String>[];
    for (var permiso in rol) {
      permisos.add(permiso.permiso);
    }

    return Scaffold(
      body: Container(
        color: const Color(0xffF3F3F3),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 const  Text(
                  "Panel Principal ",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 40,
                ),
                TextButton(
                  onPressed: () {
                    signOut();
                  },
                  child: Container(
                      width: size.width * 0.3,
                      padding: const EdgeInsets.all(25),
                      child: const Text(
                        "Cerrar Sesion",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 22, color: Color(0xff525252)),
                      )),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffD9D9D9)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (permisos.contains("mantenimiento")) ...[
                  Visibility(
                      visible: true,
                      child: TextButtons(
                        argument: finalresponse,
                        name: "Facturas",
                        route: 'mantenimiento',
                        width: 0.3,
                        fontSize: 22,
                      )),
                ],
                const SizedBox(
                  width: 30,
                ),
                if (permisos.contains("Ventas")) ...[
                  Visibility(
                    visible: true,
                    child: TextButtons(
                      argument: finalresponse,
                      name: "Modulo de Ventas",
                      route: 'mantenimiento',
                      width: 0.3,
                      fontSize: 22,
                    ),
                  ),
                ]
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (permisos.contains("Modulo de Inventario")) ...[
                  Visibility(
                    visible: true,
                    child: TextButtons(
                      argument: finalresponse,
                      name: "Módulo de Inventario",
                      route: 'mantenimiento',
                      width: 0.3,
                      fontSize: 22,
                    ),
                  ),
                ],
                const SizedBox(
                  width: 30,
                ),
                if (permisos.contains("Modulo de Inventario")) ...[
                  Visibility(
                    visible: true,
                    child: TextButtons(
                      argument: finalresponse,
                      name: "Gestión de Usuarios",
                      route: 'mantenimiento',
                      width: 0.3,
                      fontSize: 22,
                    ),
                  ),
                ]
              ],
            )
          ]),
        ),
      ),
    );
  }

  Future<Object?> getDatos() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? response = prefs.getString("response");
      finalresponse = response;
      setState(() {
        
      });
    return finalresponse;
  }

  Future<void> signOut() async {
    var response =
        await http.get(Uri.parse("http://localhost:8080/api/user/login"));
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, 'login');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final borrar = prefs.remove("response");
      setState(() {
        finalresponse = '';
      });
    }
  }
}
