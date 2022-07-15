//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/models/mostrarArqueo.model.dart';
import 'package:soft_frontend/services/Arqueo.service.dart';
import 'package:soft_frontend/screens/arqueo/components/cabeceraDeTablaArqueo.component.dart';

typedef void InCallBack(int opcion);

class MostrarArqueos extends StatefulWidget {
  const MostrarArqueos({Key? key}) : super(key: key);
  @override
  State<MostrarArqueos> createState() => _MostrarArqueosState();
}

class _MostrarArqueosState extends State<MostrarArqueos> {
  List<MostrarArqueo> arqueos = [];

  @override
  void initState() {
    super.initState();
    this._cargarArqueos();
  }

  _cargarArqueos() async {
    this.arqueos = await traerArqueos();
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
            Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.height * 0.03),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      children: [
                        CabeceraDeTablaArqueo(size: size),
                        SizedBox(height: size.height * 0.01),
                        Expanded(child: _listViewArqueo()),
                      ],
                    ))),
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

  Container _arqueoItemList(MostrarArqueo arqueos) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                arqueos.id.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueos.fechaInicio.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueos.fechaFinal.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueos.efectivoApertura.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueos.efectivoCierre.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueos.otrosPagos.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueos.ventaCredito.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueos.ventaTotal.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueos.efectivoTotal.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueos.isDelete.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueos.createdAt.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueos.updatedAt.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueos.idUsuario.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueos.idSesion.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ));
  }
}
