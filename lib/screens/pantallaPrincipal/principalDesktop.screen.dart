import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soft_frontend/controllers/user.controller.dart';
import 'package:soft_frontend/screens/screens.dart';
import 'package:soft_frontend/services/login.service.dart';
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

  @override
  
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder<User>(
      future: usercontroller(),
         builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else{
          return Center(child: PantallaDesktop(size: size, user: snapshot.data));

          }
  });
  }
}

class PantallaDesktop extends StatelessWidget {
  const PantallaDesktop({
    required this.size, required this.user
  });
  final User? user;
  final Size size;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        color: const Color(0xffF3F3F3),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Text(
                  "Panel Principal",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 40,
                ),
                TextButton(
                  onPressed: () => logout_controller(context),
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
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Visibility(
                  visible: true,
                  child: TextButtons(
                    name: "Facturas",
                    route: 'mantenimiento',
                    width: 0.3,
                    fontSize: 22,
                  )),
              const SizedBox(
                width: 30,
              ),
              Visibility(
                visible: true,
                child: TextButtons(
                  name: "Modulo de Ventas",
                  route: 'mantenimiento',
                  width: 0.3,
                  fontSize: 22,
                ),
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: true,
                  child: TextButtons(
                    name: "Módulo de Inventario",
                    route: 'mantenimiento',
                    width: 0.3,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Visibility(
                  visible: true,
                  child: TextButtons(
                    name: "Gestión de Usuarios",
                    route: 'mantenimiento',
                    width: 0.3,
                    fontSize: 22,
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
