import 'package:flutter/material.dart';
import 'package:soft_frontend/controllers/roles.controller.dart';
import 'package:soft_frontend/services/rol.service.dart';

class CrearRol extends StatefulWidget {
  @override
  State<CrearRol> createState() => _CrearRolState();
}

class _CrearRolState extends State<CrearRol> {
  var idRolController = TextEditingController();
  var rolController = TextEditingController();
  var descripcionController = TextEditingController();

  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Crear Rol'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, 'gestionRol');
                },
                child: Text('Regresar',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: constraints.maxWidth < 500
                  ? const EdgeInsets.all(20)
                  : const EdgeInsets.all(30.0),
              color: const Color(0xffF3F3F3),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Crear Rol",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "Por favor llene los campos",
                      style: TextStyle(fontSize: 15, color: Color(0xff606060)),
                    ),
                    const SizedBox(height: 40),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 500,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "Rol",
                                  style: TextStyle(fontSize: 18),
                                ),
                                TextFormField(
                                  controller: rolController,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      hintText: 'rol'),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "Descripcion",
                                  style: TextStyle(fontSize: 18),
                                ),
                                TextFormField(
                                  controller: descripcionController,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      hintText: 'Descripcion de rol'),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                TextButton(
                                  onPressed: null,
                                  child: Center(
                                    child: ElevatedButton(
                                        onPressed: () => CreaRol_controller(
                                            idRolController.text,
                                            rolController.text,
                                            descripcionController.text,
                                            context),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Text('Aceptar'),
                                        )),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }));
}
