import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/models/mostrarUnaFactura.model.dart';
import 'package:soft_frontend/screens/mostrarUnaFactura/components/cabeceradetabla.component.dart';
import 'package:soft_frontend/services/manipularfactura.service.dart';

class MostrarFactura extends StatefulWidget {
  MostrarFactura({Key? key, required this.numeroFactura}) : super(key: key);
  final int numeroFactura;

  @override
  State<MostrarFactura> createState() => _MostrarFacturaState();
}

class _MostrarFacturaState extends State<MostrarFactura> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: mostrarDatosDeUnaFactura(widget.numeroFactura.toString()),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          MostrarUnaFactura datosFactura = snapshot.data;
          final campos = datosFactura.facturaConDatos;
          final datosCliente = datosFactura.facturaConDatos.cliente;
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 243, 243, 243),
            body: Container(
              margin: EdgeInsets.only(
                left: size.width * 0.04,
                right: size.width * 0.04,
                top: size.height * 0.04,
              ),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Regresar')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      datosSuperiores(
                          'Número de factura:', campos.numeroFactura.toString()),
                      datosSuperiores('CAI', campos.talonario.cai),
                      datosSuperiores('Fecha de emisión', campos.fechaFactura.toString()),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      datosSuperiores('Cliente:', datosCliente.nombreCliente),
                      datosSuperiores('RTN:', datosCliente.rtn),
                      datosSuperiores(
                          'DNI:', datosCliente.dni),
                      datosSuperiores(
                          'Número de teléfono:', datosCliente.telefonoCliente),
                      datosSuperiores(
                          'Correo:', datosCliente.email),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      datosSuperiores('Descuento total:', campos.descuentoTotalFactura),
                      datosSuperiores('ISV total:', campos.isvTotalFactura),
                      datosSuperiores(
                          'Sub total exonerado:', campos.subTotalExonerado),
                      datosSuperiores(
                          'Sub total:', campos.subTotalFactura),
                      datosSuperiores(
                          'Total:', campos.totalFactura),
                    ],
                  ),
                  SizedBox(height: size.height * 0.03,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width *0.04,
                        vertical: size.height *0.02
                      ),
                      child: Column(
                        children: [
                          CabeceraDeTablaDeProductos(size: size,),
                          Expanded(
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (_, i) => Divider(),
                              itemCount: datosFactura.detallesDeVentas.length,
                              itemBuilder: (_, i) => _facturaItemList(datosFactura.detallesDeVentas[i]),
                                            ),
                          ),
                        ],
                      ),
                    )),
                ],
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Container _facturaItemList(DetallesDeVenta idProducto) {
    final producto = idProducto.producto;
    final detalleVenta = idProducto;
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                producto.codigoProducto,
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                producto.nombreProducto,
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                detalleVenta.isvAplicado,
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                detalleVenta.cantidad.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                detalleVenta.precioUnitario,
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: Text(
            //     factura.nombreCliente,
            //     style: GoogleFonts.lato(fontSize: size.width * 0.009),
            //   ),
            // ),
            // Expanded(
            //   flex: 1,
            //   child: Text(
            //     factura.rtn,
            //     style: GoogleFonts.lato(fontSize: size.width * 0.009),
            //   ),
            // ),
            // Expanded(
            //     flex: 1,
            //     child: ElevatedButton(
            //         onPressed: () {
            //           Navigator.push(context, MaterialPageRoute(builder: (context) => MostrarFactura(numeroFactura: factura.numeroFactura)));
            //         },
            //         child: Icon(Icons.visibility)))
          ],
        ));
  }

  Column datosSuperiores(String campo, String valor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(campo),
        Text(
          valor,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
