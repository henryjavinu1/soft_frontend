import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/models/facturaBuscada.model.dart';
import 'package:soft_frontend/models/unaFacturaBuscada.model.dart';
import 'package:soft_frontend/services/manipularfactura.service.dart';

class ManipularFactura extends StatefulWidget {
  const ManipularFactura({Key? key}) : super(key: key);
  @override
  State<ManipularFactura> createState() => _ManipularFacturaState();
}

class _ManipularFacturaState extends State<ManipularFactura> {
  final _textController = new TextEditingController();
  List<FacturaBuscada> facturas = [];

  @override
  void initState() {
    super.initState();
    this._cargarFact();
  }

  _cargarFact() async {
    this.facturas = await traerFactura();
    setState(() {});
    // print(facturas.length);
  }

  @override
  Widget build(BuildContext context) {
    // print(facturas.length);
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
                    'Buscar Factura',
                    style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: size.width * 0.015,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Número de factura',
                  ),
                ),
              )),
              ElevatedButton(
                onPressed: () async {
                  if (_textController.text.trim().isNotEmpty) {
                    facturas.clear();
                    UnaFacturaBuscada factura = await buscarFacturaPorNumero(_textController.text.trim());
                    print(factura.facturaBuscada);
                    // facturas.add(factura);
                    // if (facturas.length == 0){
                    //   showDialog(context: context, builder: (BuildContext context) =>
                    //     AlertDialog(title: Text('No se encontró ninguna factura con el número de factura: ${_textController.text}'), actions: [
                    //       ElevatedButton(onPressed: (){ Navigator.pop(context);}, child: Text('Cerrar'))
                    //     ],));
                    // } else {
                    //   // this.facturas = resp;
                    //   setState(() {
                        
                    //   });
                    // }
                  } else {
                    showDialog(context: context, builder: (BuildContext context) =>
                        AlertDialog(title: Text('El campo de búsqueda está vacío.'), actions: [
                          ElevatedButton(onPressed: (){ Navigator.pop(context);}, child: Text('Cerrar'))
                        ],));
                  }
                },
                child: Text(
                  'Buscar',
                  style: GoogleFonts.lato(),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      horizontal: size.width * 0.015, vertical: 26)),
                ),
              )
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
                                'Número de Factura',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800,
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Fecha',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Total',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Nombre de empleado',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'CAI',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Nombre de cliente',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'RTN',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01, fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Expanded(child: _listViewUsuarios()),
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (_, i) => Divider(),
      itemCount: facturas.length,
      itemBuilder: (_, i) => _facturaItemList(facturas[i]),
    );
  }

  Container _facturaItemList(FacturaBuscada factura) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Expanded(
            //   flex: 1,
            //   child: Text(
            //     '${factura.idFactura}',
            //     style: GoogleFonts.lato(
            //         fontSize: size.width * 0.009, color: Colors.black),
            //   ),
            // ),
            Expanded(
              flex: 1,
              child: Text(
                '${factura.numeroFactura}',
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                factura.fechaFactura.toString().substring(0, 10),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            // Text(
            //   factura.descuentoTotalFactura,
            //   style: GoogleFonts.lato(fontSize: size.width * 0.009),
            // ),
            // Text(
            //   factura.isvTotalFactura,
            //   style: GoogleFonts.lato(fontSize: size.width * 0.009),
            // ),
            Expanded(
              flex: 1,
              child: Text(
                factura.totalFactura,
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            // Text(
            //   factura.cantidadLetras,
            //   style: GoogleFonts.lato(fontSize: size.width * 0.009),
            // ),
            // Expanded(
            //   flex: 1,
            //   child: Text(
            //     '${factura.idEmpleado}',
            //     style: GoogleFonts.lato(fontSize: size.width * 0.009),
            //   ),
            // ),
            Expanded(
              flex: 2,
              child: Text(
                factura.nombreEmpleado,
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            // Text(
            //   factura.tipoPago,
            //   style: GoogleFonts.lato(fontSize: size.width * 0.009),
            // ),
            Expanded(
              flex: 3,
              child: Text(
                (factura.cai ==
                        "No existe un talonario asociado a este CAI por favor comuniquese con el administrador.")
                    ? "N/A"
                    : factura.cai,
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                factura.nombreCliente,
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                factura.rtn,
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            // Text(
            //   factura.direccionCliente,
            //   style: GoogleFonts.lato(fontSize: size.width * 0.009),
            // ),
            // Expanded(
            //   flex: 1,
            //   child: Text(
            //     factura.telefonoCliente,
            //     style: GoogleFonts.lato(fontSize: size.width * 0.009),
            //   ),
            // ),
          ],
        ));
  }
}
