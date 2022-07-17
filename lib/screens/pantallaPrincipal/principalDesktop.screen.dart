import 'package:flutter/material.dart';
import 'package:soft_frontend/controllers/user.controller.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

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


  final int? cantidadPermisos = user?.rol.permisos.length;
  final List <int?> permisosId = <int>[];

  for (int i = 0; i < cantidadPermisos!; i++) {
    permisosId.add(user?.rol.permisos[i].id);
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
                 Text(
                  "Panel Principal ${user?.usuario}",
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
                            TextStyle(fontSize: 18, color: Color(0xff525252)),
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
              if (permisosId.contains(8) || permisosId.contains(40) ) ...[
              Visibility(
                  visible: true,
                  child: TextButtons (
                    name: "Modulo de Mantenimiento",
                    route: 'mantenimiento',
                    width: 0.3,
                    fontSize: 18,
                  )),
              ],
               SizedBox(
                width: 30,
              ),
              if (permisosId.contains(44) || permisosId.contains(15) ) ...[
              Visibility(
                visible: true,
                child: TextButtons(
                  name: "Modulo de Ventas",
                  route: 'PrincipalVenta',
                  width: 0.3,
                  fontSize: 18,
                ),
              ),
              ],
            ]),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (permisosId.contains(43) || permisosId.contains(28) || permisosId.contains(12) ) ...[
                Visibility(
                  visible: true,
                  child: TextButtons(
                    name: "Gestion de Usuarios",
                    route: 'PrincipalGestion',
                    width: 0.3,
                    fontSize: 18,
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
}
