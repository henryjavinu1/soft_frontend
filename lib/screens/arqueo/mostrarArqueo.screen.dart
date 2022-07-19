// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/models/arqueo.model.dart';
import 'package:soft_frontend/services/arqueo.service.dart';
import 'package:soft_frontend/controllers/arqueo.controller.dart';
import 'package:soft_frontend/screens/arqueo/crearArqueo.screen.dart';
import 'package:soft_frontend/screens/arqueo/cerrarSesionActualizandoArqueo.screen.dart';

class MostrarArqueos extends StatefulWidget {
  const MostrarArqueos({Key? key}) : super(key: key);

  @override
  State<MostrarArqueos> createState() => _MostrarArqueosState();
}

class _MostrarArqueosState extends State<MostrarArqueos> {
  List<Arqueo> listaArqueos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var idUsuarioController = TextEditingController();
    return Scaffold(
        appBar: AppBar(title: const Text('Modulo Arqueo')),
        body: FutureBuilder(
          future: traerArqueos(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              ManipularArqueo list = snapshot.data;
              listaArqueos = list.arqueos;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02),
                          child: TextField(
                            controller: idUsuarioController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'id de Usuario',
                            ),
                          ),
                        )),
                        ElevatedButton(
                          onPressed: () async {
                            if (idUsuarioController.text.trim().isNotEmpty) {
                              print(idUsuarioController.text.trim());
                              Arqueo? mostArqu = await buscarArqueoPorIdUsuario(
                                  idUsuarioController.text.trim(), context);
                              print(mostArqu);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: Text(
                                            'El campo de búsqueda está vacío.'),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Cerrar'))
                                        ],
                                      ));
                            }
                          },
                          child: Text(
                            'Buscar',
                            style: GoogleFonts.lato(),
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: size.width * 0.015,
                                    vertical: 9)),
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context)
                                  .push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new CrearArqueo(),
                              )),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Text('Crear Nuevo Arqueo'),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context)
                                  .push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new ActualizarArqueCerrandoSesion(),
                              )),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Text('Cerrar Sesion'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: ListView.separated(
                            itemBuilder: (_, i) => item(listaArqueos[i]),
                            itemCount: list.arqueos.length,
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
        ));
  }

  Widget item(Arqueo lista) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(lista.idArqueo.toString())),
        Expanded(flex: 1, child: Text(lista.fechaInicio.toString())),
        Expanded(flex: 1, child: Text(lista.fechaFinal.toString())),
        Expanded(flex: 1, child: Text(lista.efectivoApertura)),
        Expanded(flex: 1, child: Text(lista.efectivoCierre)),
        Expanded(flex: 1, child: Text(lista.otrosPagos)),
        Expanded(flex: 1, child: Text(lista.ventaCredito)),
        Expanded(flex: 1, child: Text(lista.ventaTotal)),
        Expanded(flex: 1, child: Text(lista.efectivoTotal)),
        Expanded(flex: 1, child: Text(lista.isDelete.toString())),
        Expanded(flex: 1, child: Text(lista.createdAt.toString())),
        Expanded(flex: 1, child: Text(lista.updatedAt.toString())),
        Expanded(flex: 1, child: Text(lista.idUsuario.toString())),
        Expanded(flex: 1, child: Text(lista.idSesion.toString())),
        Expanded(
            flex: 1,
            child: TextButton(
              child: Text('Eliminar'),
              onPressed: () {
                _showDialog(context, lista.idArqueo.toString());
              },
            )),
      ],
    );
  }

  void _showDialog(BuildContext context, String idArqueo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        print(idArqueo);
        return AlertDialog(
          title: Text('ELiminar Arqueo'),
          content: Text('¿Quieres eliminar el arqueo?'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Si'),
              onPressed: () {
                eliminarArqueo_Controller(idArqueo, context);
              },
            ),
            ElevatedButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void buscarArqueoIdUsuario(String query) {
    final sugerencia = listaArqueos.where((listaArqueos) {
      final idSesion1 = listaArqueos.idSesion;
      final input = query;
      return idSesion1.toString().contains(input);
    }).toList();

    setState(() {
      listaArqueos = sugerencia;
    });
  }
}
