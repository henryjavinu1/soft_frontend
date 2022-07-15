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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02, horizontal: size.width * 0.03),
        child: Column(
          children: [
            Row(children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(right: size.width * 0.01),
                  child: Text(
                    'Arqueos',
                    style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: size.width * 0.015,
                        fontWeight: FontWeight.w600),
                  ),
                ),
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
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'id',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'fechaInicio',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'fechaFinal',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'efectivoApertura',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'efectivoCierre',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'otrosPagos',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'ventaCredito',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'ventaTotal',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'efectivoTotal',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'isDelete',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'createdAt',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'updatedAt',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'idUsuario',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'idSesion',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Expanded(child: _listViewArqueo()),
                      ],
                    )))
          ],
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

  Container _arqueoItemList(MostrarArqueo arqueosss) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.id.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.fechaInicio.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.fechaFinal.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.efectivoApertura.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.efectivoCierre.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.otrosPagos.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.ventaCredito.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.ventaTotal.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.efectivoTotal.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.isDelete.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.createdAt.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.updatedAt.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.idUsuario.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                arqueosss.idSesion.toString(),
                style: GoogleFonts.lato(
                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ));
  }
}
