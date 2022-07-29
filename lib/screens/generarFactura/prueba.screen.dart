import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/models/manipularVenta.model.dart';
import 'package:soft_frontend/models/ventaBuscada.model.dart';
import 'package:soft_frontend/services/mostrarVentas.service.dart';

import '../../services/ventas.service.dart';
import 'generarFactura.screen.dart';

class BuscarVenta extends StatefulWidget {
  const BuscarVenta({Key? key}) : super(key: key);

  @override
  State<BuscarVenta> createState() => _BuscarVentaState();
}

class _BuscarVentaState extends State<BuscarVenta> {
  final TextEditingController? _textEditingController = TextEditingController();
  List<MostrarVenta> listaVentas = [];
  List<MostrarVenta> filtroVentas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Modulo Venta'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, 'pantalla_principal');
              },
              child: Text('Regresar',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
        body: FutureBuilder(
          future: traerVentas(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              ManipularVenta lista = snapshot.data;
              listaVentas = lista.ventaA;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(right: size.width * 0.01),
                            child: Text(
                              'Buscar Venta por Id',
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontSize: size.width * 0.015,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                filtroVentas = listaVentas
                                    .where((element) =>
                                        element.id.toString().contains(value))
                                    .toList();
                              });
                            },
                            controller: _textEditingController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.02),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              labelText: 'Id de Venta',
                            ),
                          ),
                        )),
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
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: _textEditingController!
                                                  .text.isNotEmpty
                                              ? filtroVentas.length
                                              : listaVentas.length,
                                          itemBuilder: (context, index) {
                                            //item(listaArqueos[index]);
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(
                                                        _textEditingController!
                                                                .text.isNotEmpty
                                                            ? filtroVentas[
                                                                    index]
                                                                .id
                                                                .toString()
                                                            : listaVentas[index]
                                                                .id
                                                                .toString(),
                                                        style: GoogleFonts.lato(
                                                            fontSize:
                                                                size.width *
                                                                    0.01,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color:
                                                                Colors.black),
                                                        textAlign:
                                                            TextAlign.center,
                                                        textScaleFactor: 1,
                                                      )),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Text(
                                                        _textEditingController!
                                                                .text.isNotEmpty
                                                            ? filtroVentas[
                                                                    index]
                                                                .totalIsv
                                                                .toString()
                                                            : listaVentas[index]
                                                                .totalIsv
                                                                .toString(),
                                                        style: GoogleFonts.lato(
                                                            fontSize:
                                                                size.width *
                                                                    0.01,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color:
                                                                Colors.black),
                                                        textAlign:
                                                            TextAlign.center,
                                                        textScaleFactor: 1,
                                                      )),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Text(
                                                        _textEditingController!
                                                                .text.isNotEmpty
                                                            ? filtroVentas[
                                                                    index]
                                                                .totalDescuentoVenta
                                                                .toString()
                                                            : listaVentas[index]
                                                                .totalDescuentoVenta
                                                                .toString(),
                                                        style: GoogleFonts.lato(
                                                            fontSize:
                                                                size.width *
                                                                    0.01,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color:
                                                                Colors.black),
                                                        textAlign:
                                                            TextAlign.center,
                                                        textScaleFactor: 1,
                                                      )),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        _textEditingController!
                                                                .text.isNotEmpty
                                                            ? filtroVentas[
                                                                    index]
                                                                .totalVenta
                                                                .toString()
                                                            : listaVentas[index]
                                                                .totalVenta
                                                                .toString(),
                                                        style: GoogleFonts.lato(
                                                            fontSize:
                                                                size.width *
                                                                    0.01,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color:
                                                                Colors.black),
                                                        textAlign:
                                                            TextAlign.center,
                                                        textScaleFactor: 1,
                                                      )),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        _textEditingController!
                                                                .text.isNotEmpty
                                                            ? filtroVentas[
                                                                    index]
                                                                .establecimiento
                                                                .toString()
                                                            : listaVentas[index]
                                                                .establecimiento
                                                                .toString(),
                                                        style: GoogleFonts.lato(
                                                            fontSize:
                                                                size.width *
                                                                    0.01,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color:
                                                                Colors.black),
                                                        textAlign:
                                                            TextAlign.center,
                                                        textScaleFactor: 1,
                                                      )),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        _textEditingController!
                                                                .text.isNotEmpty
                                                            ? filtroVentas[
                                                                    index]
                                                                .nombreEmpleado
                                                                .toString()
                                                            : listaVentas[index]
                                                                .nombreEmpleado
                                                                .toString(),
                                                        style: GoogleFonts.lato(
                                                            fontSize:
                                                                size.width *
                                                                    0.01,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color:
                                                                Colors.black),
                                                        textAlign:
                                                            TextAlign.center,
                                                        textScaleFactor: 1,
                                                      )),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        _textEditingController!
                                                                .text.isNotEmpty
                                                            ? filtroVentas[
                                                                    index]
                                                                .nombreCliente
                                                                .toString()
                                                            : listaVentas[index]
                                                                .nombreCliente
                                                                .toString(),
                                                        style: GoogleFonts.lato(
                                                            fontSize:
                                                                size.width *
                                                                    0.01,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color:
                                                                Colors.black),
                                                        textAlign:
                                                            TextAlign.center,
                                                        textScaleFactor: 1,
                                                      )),
                                                ],
                                              ),
                                            );
                                          }),
                                      /*ListView.separated(
                                        itemBuilder: (_, i) =>
                                            item(listaArqueos[i]),
                                        itemCount: list.arqueos.length,
                                        separatorBuilder: (_, i) =>
                                            const Divider(),
                                      ),*/
                                    ),
                                  ),
                                ),
                              ],
                            ))),
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

  Widget item(MostrarVenta lista) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              lista.id.toString(),
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
              lista.totalIsv.toString(),
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(
              lista.totalDescuentoVenta.toString(),
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(
              lista.totalVenta,
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
              lista.establecimiento,
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            )),
        Expanded(
            flex: 1,
            child: Text(lista.nombreEmpleado,
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
                textAlign: TextAlign.center,
                textScaleFactor: 1)),
        Expanded(
            flex: 1,
            child: Text(
              lista.nombreCliente,
              style: GoogleFonts.lato(
                  fontSize: size.width * 0.01,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            )),
        TextButton(
          onPressed: null,
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new CrearFactura(venta: lista),
              ),
            ),
            child: Text('Procesar'),
          ),
        ),
        TextButton(
          onPressed: () => eliminarVenta(lista.id.toString()),
          child: Text('Eliminar'),
        ),
      ],
    );
  }
}
