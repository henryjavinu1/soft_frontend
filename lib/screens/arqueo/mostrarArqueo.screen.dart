//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/models/arqueo.model.dart';
import 'package:soft_frontend/services/arqueo.service.dart';

class MostrarArqueo extends StatefulWidget {
  const MostrarArqueo({Key? key}) : super(key: key);
  @override
  State<MostrarArqueo> createState() => _MostrarArqueoState();
}

class _MostrarArqueoState extends State<MostrarArqueo> {
  /*var idController = TextEditingController();
  var fechaIncioController = TextEditingController();
  var fechaFinalController = TextEditingController();
  var efectivoAperturaController = TextEditingController();
  var efectivoCierreController = TextEditingController();
  var otrosPagosController = TextEditingController();
  var ventaCreditoController = TextEditingController();
  var ventaTotalController = TextEditingController();
  var efectivoTotalController = TextEditingController();
  var isDeleteController = TextEditingController();
  var createdAtController = TextEditingController();
  var updatedAtController = TextEditingController();
  var idUsuarioController = TextEditingController();
  var idSesionController = TextEditingController();*/
  List<Arqueo> arqueo = [];
  int campos = 1000;
  int _atributoSeleccionado = 0;

  @override
  void initState() {
    super.initState();
    _cargarArqueo();
  }

  _cargarArqueo() async {
    this.arqueo = await mostrarArqueo();
    setState(() {});
  }

  set intSale(int value) {
    setState(() {
      _atributoSeleccionado = value;
    });
  }

  @override
  //crear una tabla usando dataTable de flutter
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.05, horizontal: size.width * 0.05),
          child: Column(
            children: [
              Row(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: size.width * 0.05),
                      child: Text(
                        'Mostrar Arqueos',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: size.width * 0.015,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.05),
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02,
                          horizontal: size.width * 0.03),
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
                                  'ID',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Fecha Inicio',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Fecha Final',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Efectivo Apertura',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Efectivo Cierre',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Otros Pagos',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Venta Credito',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Venta Total',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Efectivo Total',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Is Delete',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Created At',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Updated At',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'ID Usuario',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'ID Sesion',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ))),
            ],
          ),
        ));
  }
}
