import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/screens/generarFactura/generarFactura.screen.dart';
import 'package:soft_frontend/models/ventaBuscada.model.dart';
import 'package:soft_frontend/services/mostrarVentas.service.dart';
import 'package:soft_frontend/services/ventas.service.dart';

class EscogerVenta extends StatefulWidget {
  @override
  State<EscogerVenta> createState() => _EscogerVentaState();
}

class _EscogerVentaState extends State<EscogerVenta> {
  final _textController = new TextEditingController();
  List<MostrarVenta> venta = [];
  List<MostrarVenta> filtroVenta = [];

  @override
  void initState() {
    super.initState();
    this._cargarFact();
  }

  _cargarFact() async {
    this.venta = await traerVentas();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Modulo Ventas')),
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02, horizontal: size.width * 0.03),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            filtroVenta = venta
                                .where((element) =>
                                    element.id.toString().contains(value))
                                .toList();
                          });
                        },
                        controller: _textController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(size.width * 0.02),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          labelText: 'Buscar Por ID venta',
                        ),
                      ),
                    )),
              ],
            ),
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
                                'ID Venta',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'ISV Venta',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Descuento Venta',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                'Total Venta',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                'Establecimiento',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                'Empleado',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                'Cliente',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                ' ',
                                style: GoogleFonts.lato(
                                    fontSize: size.width * 0.01,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                ' ',
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
      itemCount: venta.length,
      itemBuilder: (_, i) => _pagoItemList(venta[i]),
    );
  }

  Container _pagoItemList(MostrarVenta venta) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                venta.id.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                venta.totalIsv.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                venta.totalDescuentoVenta.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                venta.totalVenta.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                venta.establecimiento.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                venta.nombreEmpleado.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                venta.nombreCliente.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            TextButton(
              onPressed: () => procesarVenta(venta.id.toString()).then(
                (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CrearFactura(venta: venta),
                  ),
                ),
              ),
              child: Text('Procesar'),
            ),
            TextButton(
              onPressed: () => eliminarVenta(venta.id.toString())
                  .then((value) => this._cargarFact()),
              child: Text('Eliminar'),
            ),
          ],
        ));
  }
}
