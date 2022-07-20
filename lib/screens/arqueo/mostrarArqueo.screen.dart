// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/models/arqueo.model.dart';
import 'package:soft_frontend/services/arqueo.service.dart';
import 'package:soft_frontend/controllers/arqueo.controller.dart';
import 'package:soft_frontend/screens/arqueo/crearArqueo.screen.dart';
import 'package:soft_frontend/screens/arqueo/cerrarSesionActualizandoArqueo.screen.dart';
import 'package:soft_frontend/screens/arqueo/components/cabeceraDeTablaArqueo.component.dart';

import 'buscarArqueoIdUsuario.screen.dart';

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
                        TextButton(
                          onPressed: null,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context)
                                  .push(new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new BuscarArqueoIdUsuario(),
                              )),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Text('Buscar un Arqueo'),
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
                        child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.02),
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.02,
                                horizontal: size.height * 0.03),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Column(
                              children: [
                                CabeceraDeTablaArqueo(size: size),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: ListView.separated(
                                        itemBuilder: (_, i) =>
                                            item(listaArqueos[i]),
                                        itemCount: list.arqueos.length,
                                        separatorBuilder: (_, i) =>
                                            const Divider(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )))
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
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              lista.idArqueo.toString(),
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(
              lista.fechaInicio.toString(),
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(
              lista.fechaFinal.toString(),
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(
              lista.efectivoApertura,
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(lista.efectivoCierre,
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
                textAlign: TextAlign.center,
                textScaleFactor: 1)),
        Expanded(
            flex: 1,
            child: Text(
              lista.otrosPagos,
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(
              lista.ventaCredito,
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(
              lista.ventaTotal,
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(
              lista.efectivoTotal,
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(
              lista.isDelete.toString(),
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(
              lista.createdAt.toString(),
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(
              lista.updatedAt.toString(),
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(
              lista.idUsuario.toString(),
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(
              lista.idSesion.toString(),
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 2,
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
