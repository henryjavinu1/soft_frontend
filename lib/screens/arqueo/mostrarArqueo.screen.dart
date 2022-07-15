//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/models/mostrarArqueo.model.dart';
import 'package:soft_frontend/services/arqueo.service.dart';
import 'package:soft_frontend/screens/arqueo/components/cabeceraDeTablaArqueo.component.dart';

typedef void InCallBack(int opcion);

class MostrarArqueo extends StatefulWidget {
  const MostrarArqueo({Key? key}) : super(key: key);
  @override
  State<MostrarArqueo> createState() => _MostrarArqueoState();
}

class _MostrarArqueoState extends State<MostrarArqueo> {
  List<Arqueo> arqueos = [];

  @override
  void initState() {
    super.initState();
    _cargarArqueos();
  }

  _cargarArqueos() async {
    this.arqueos = await mostrarArqueo();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03,
          vertical: size.height * 0.02,
        ),
        child: Column(
          children: [
            Row(children: [
              Center(
                child: Padding(
                    padding: EdgeInsets.only(right: size.width * 0.01),
                    child: Text(
                      'Arqueos',
                      style: GoogleFonts.poppins(
                          fontSize: size.width * 0.015,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    )),
              ),
            ]),
            CabeceraDeTablaArqueo(size: size),
            SizedBox(height: size.height * 0.01),
            Expanded(child: _listViewArqueo()),
          ], //Children
        ),
      ),
    );
  }

  ListView _listViewArqueo() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (_, i) => Divider(),
      itemCount: arqueos.length,
      itemBuilder: (_, i) => _arqueoItemList(arqueos[i]),
    );
  }

  Container _arqueoItemList(Arqueo arqueo) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                arqueo.id.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueo.fechaInicio.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueo.fechaFinal.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueo.efectivoApertura.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueo.efectivoCierre.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueo.otrosPagos.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueo.ventaCredito.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueo.ventaTotal.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueo.efectivoTotal.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueo.isDelete.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueo.createdAt.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueo.updatedAt.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueo.idUsuario.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueo.idSesion.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ));
  }
}
