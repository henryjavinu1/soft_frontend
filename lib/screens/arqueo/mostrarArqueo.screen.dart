//ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/arqueo.model.dart';
import 'package:soft_frontend/services/arqueo.service.dart';
import 'package:soft_frontend/controllers/arqueo.controller.dart';
import 'package:soft_frontend/screens/arqueo/crearArqueo.screen.dart';
import 'package:soft_frontend/screens/arqueo/cerrarSesionActualizandoArqueo.screen.dart';
import 'package:soft_frontend/screens/arqueo/components/cabeceraDeTablaArqueo.component.dart';

class MostrarArqueosss extends StatefulWidget {
  const MostrarArqueosss({Key? key}) : super(key: key);
  @override
  State<MostrarArqueosss> createState() => _MostrarArqueosssState();
}

class _MostrarArqueosssState extends State<MostrarArqueosss> {
  List<Arqueo> listaArqueos = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var idUsuarioController = new TextEditingController();
    return Scaffold(
        appBar: AppBar(title: const Text('Modulo Arqueos')),
        body: Container(
            child: FutureBuilder(
                future: traerArqueos(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    ManipularArqueo lista = snapshot.data;
                    listaArqueos = lista.arqueos;

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
                                  if (idUsuarioController.text
                                      .trim()
                                      .isNotEmpty) {
                                    print(idUsuarioController.text.trim());
                                    Arqueo? mostArqu =
                                        await buscarArqueoPorIdUsuario(
                                            idUsuarioController.text.trim(),
                                            context);
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
                                          new CrearArque(),
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
                                  itemCount: lista.arqueos.length,
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
                })));
  }

  Widget item(Arqueo lista) {
    Size size = MediaQuery.of(context).size;
    return Row(children: [
      Expanded(
          child: Container(
              margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.height * 0.03),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                children: [
                  CabeceraDeTablaArqueo(size: size),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                ],
              ))),
      Expanded(
          child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02, horizontal: size.height * 0.03),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Text(lista.idArqueo.toString(),
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800))),
            Expanded(
                flex: 1,
                child: Text(lista.fechaInicio.toString(),
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800))),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 1,
                child: Text(lista.fechaFinal.toString(),
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800))),
            Expanded(
                flex: 1,
                child: Text(lista.efectivoApertura.toString(),
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800))),
            Expanded(
                flex: 1,
                child: Text(lista.efectivoCierre.toString(),
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800))),
            Expanded(
                flex: 1,
                child: Text(lista.otrosPagos.toString(),
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800))),
            Expanded(
                flex: 1,
                child: Text(lista.ventaCredito.toString(),
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800))),
            Expanded(
                flex: 1,
                child: Text(lista.ventaTotal.toString(),
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800))),
            Expanded(
                flex: 1,
                child: Text(lista.efectivoTotal.toString(),
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800))),
            Expanded(
                flex: 1,
                child: Text(lista.isDelete.toString(),
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800))),
            Expanded(
                flex: 1,
                child: Text(lista.createdAt.toString(),
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800))),
            Expanded(
                flex: 1,
                child: Text(lista.updatedAt.toString(),
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800))),
            Expanded(
                flex: 1,
                child: Text(lista.idUsuario.toString(),
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800))),
            Expanded(
                flex: 1,
                child: Text(lista.idSesion.toString(),
                    style: GoogleFonts.lato(
                        fontSize: size.width * 0.01,
                        fontWeight: FontWeight.w800))),
            Expanded(
                flex: 1,
                child: TextButton(
                  child: Text('Eliminar'),
                  onPressed: () {
                    _showDialog(context, lista.idArqueo.toString());
                  },
                )),
          ],
        ),
      ))
    ]);
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
}
