// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:soft_frontend/services/rol.service.dart';
import '../../models/gestionrol.model.dart';

class MostrarRol extends StatefulWidget {
  const MostrarRol({Key? key}) : super(key: key);

  @override
  State<MostrarRol> createState() => _MostrarRolState();
}

class _MostrarRolState extends State<MostrarRol> {
  List<TodosLosRol> listaRol = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var buscadorcontroller = TextEditingController();

    return Scaffold(
        appBar: AppBar(title: const Text("Modulo Roles")),
        body: Container(
          child: FutureBuilder(
            future: mostrarRol(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: const CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                Role lista = snapshot.data;
                listaRol = lista.todoslosRoles;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'crearRol');
                            },
                            child: Container(
                                width: size.width * 0.2,
                                padding: const EdgeInsets.all(15),
                                child: const Text(
                                  "Nuevo Rol",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xFFF1F1F1)),
                                )),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFF5FA9E6)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: size.height * 0.15),
                            child: Text(
                              'Rol',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: size.height * 0.35),
                            child: Text(
                              'Descripcion',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: size.height * 0.50),
                            child: Text(
                              'Opciones',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: ListView.separated(
                              itemBuilder: (_, i) => item(listaRol[i]),
                              itemCount: lista.todoslosRoles.length,
                              separatorBuilder: (_, i) => const Divider(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }

  Widget item(TodosLosRol lista) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text(lista.rol)),
        Expanded(flex: 2, child: Text(lista.descripcion)),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: const Text('Actualizar'),
        ),
        Expanded(
          flex: 1,
          child: const Text('Eliminar'),
        ),
      ],
    );
  }
}
