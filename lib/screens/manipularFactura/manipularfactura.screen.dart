import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/models/errorPeticion.model.dart';

import 'package:soft_frontend/models/facturaBuscada.model.dart';
import 'package:soft_frontend/models/unaFacturaBuscada.model.dart';
import 'package:soft_frontend/screens/manipularFactura/components/cabeceradetabla.component.dart';
import 'package:soft_frontend/screens/mostrarUnaFactura/mostrarunafactura.screen.dart';
import 'package:soft_frontend/services/manipularfactura.service.dart';

typedef void IntCallback(int opcion);

class ManipularFactura extends StatefulWidget {
  const ManipularFactura({Key? key}) : super(key: key);
  @override
  State<ManipularFactura> createState() => _ManipularFacturaState();
}

class _ManipularFacturaState extends State<ManipularFactura> {
  final _textController = new TextEditingController();
  final _textController2 = new TextEditingController();
  String hintText = 'Número de factura';
  List<FacturaBuscada> facturas = [];
  List<FacturaBuscada> facturasPorCliente = [];
  int campos = 1000;
  int _atributoSeleccionado = 0;

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

  set intSele(int value) => setState(() => _atributoSeleccionado = value);

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
            Row(
              children: [
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
              ],
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DropdownButton(
                hint: Text(hintText),
                items: const [
                  DropdownMenuItem(
                    child: Text('Buscar por número de factura'),
                    value: 0,
                  ),
                  DropdownMenuItem(
                    child: Text('Filtrar por cliente'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('Filtrar por fecha'),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text('Filtrar por talonario'),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text('Filtrar por empleado'),
                    value: 4,
                  ),
                ],
                onChanged: (int? value) {
                  if (value == 1) {
                    campos = 1;
                    _atributoSeleccionado = 0;
                    hintText = 'Filtrar por cliente';
                    setState(() {});
                  } else if (value == 2) {
                    campos = 2;
                    _atributoSeleccionado = 0;
                    hintText = 'Filtrar por fecha';
                    setState(() {});
                  } else if (value == 3) {
                    campos = 3;
                    _atributoSeleccionado = 0;
                    hintText = 'Filtrar por talonario';
                    setState(() {});
                  } else if (value == 4) {
                    campos = 4;
                    _atributoSeleccionado = 0;
                    hintText = 'Filtrar por empleado';
                    setState(() {});
                  } else {
                    campos = 0;
                    _atributoSeleccionado = 0;
                    hintText = 'Buscar por número de factura';
                    setState(() {});
                  }
                },
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: CamposDeBusqueda(
                    textController: _textController,
                    textController2: _textController2,
                    campo: campos,
                    callback: (val) =>
                        setState(() => _atributoSeleccionado = val)),
              )),
              ElevatedButton(
                onPressed: () async {
                  // Valida si el campo de búsqueda está vacío.
                  if (_textController.text.trim().isNotEmpty) {
                    // Si la búsqueda se hace por cliente.
                    if (campos == 1) {
                      // Si se hace por el atributo nombre cliente. 
                      if (_atributoSeleccionado == 0) {
                        final response = await filtrarFacturasPorCliente(
                            _textController.text.trim(), '', '');
                        if (response is List<FacturaBuscada>) {
                          facturas = response;
                          setState(() {});
                        } else if (response == 404) {
                          dialogMensajeProblema(context,
                              'No se encontró ningún resultado para la factura con número: ${_textController.text.trim()}');
                        }
                        setState(() {});
                      } else if (_atributoSeleccionado == 1) {
                        final response = await filtrarFacturasPorCliente(
                            '', _textController.text.trim(), '');
                        if (response is List<FacturaBuscada>) {
                          facturas = response;
                          setState(() {});
                        } else if (response == 404) {
                          dialogMensajeProblema(context,
                              'No se encontró ningún resultado para la factura con número: ${_textController.text.trim()}');
                        } else if (response is MensajePeticion) {
                          MensajePeticion mensajeError = response;
                          dialogMensajeProblema(context, mensajeError.msg);
                        }
                        setState(() {});
                      } else if (_atributoSeleccionado == 2) {
                        final response = await filtrarFacturasPorCliente(
                            '', '', _textController.text.trim());
                        if (response is List<FacturaBuscada>) {
                          facturas = response;
                          setState(() {});
                        } else if (response == 404) {
                          dialogMensajeProblema(context,
                              'No se encontró ningún resultado para la factura con número: ${_textController.text.trim()}');
                        } else if (response is MensajePeticion) {
                          MensajePeticion mensajeError = response;
                          dialogMensajeProblema(context, mensajeError.msg);
                        }
                      }
                      // Buscar por fecha
                    } else if (campos == 2) {
                      // Validar de que el segundo campo está vacío
                      if (_textController2.text.isEmpty) {
                        final response = await filtrarFacturasPorFecha(
                            _textController.text.trim(), '');
                        if (response is List<FacturaBuscada>) {
                          facturas = response;
                          setState(() {});
                        } else if (response == 404) {
                          dialogMensajeProblema(context,
                              'No se encontró ningúna factura el día: ${_textController.text.trim()}');
                        } else if (response is MensajePeticion) {
                          MensajePeticion mensajeError = response;
                          dialogMensajeProblema(context, mensajeError.msg);
                        }
                        // Si ambos campos tienen datos
                      } else {
                        final response = await filtrarFacturasPorFecha(
                            _textController.text.trim(),
                            _textController2.text.trim());
                        if (response is List<FacturaBuscada>) {
                          facturas = response;
                          setState(() {});
                        } else if (response == 404) {
                          dialogMensajeProblema(context,
                              'No se encontró ningúna factura el ${_textController.text.trim()} y el ${_textController2.text.trim()}');
                        } else if (response is MensajePeticion) {
                          MensajePeticion mensajeError = response;
                          dialogMensajeProblema(context, mensajeError.msg);
                        }
                      }
                      // Si la búsqueda es por talonario.
                    } else if (campos == 3) {
                      // Si la búsqueda es por IdFactura
                      if (_atributoSeleccionado == 0) {
                        // Si encontró facturas que las inserte a la lista.
                        final response = await filtrarFacturasPorTalonario(
                            _textController.text.trim(), '');
                        if (response is List<FacturaBuscada>) {
                          facturas = response;
                          // Si no encontró ningúna coincidencia.
                        } else if (response == 404) {
                          dialogMensajeProblema(context,
                              'No se encontró ningúna factura con el id de talonario: ${_textController.text.trim()}');
                        } else if (response is MensajePeticion) {
                          MensajePeticion mensajeError = response;
                          dialogMensajeProblema(context, mensajeError.msg);
                        }
                        // Si la búsqueda es por CAI
                      } else if (_atributoSeleccionado == 1) {
                        // Si encontró facturas que las inserte a la lista.
                        final response = await filtrarFacturasPorTalonario(
                            '', _textController.text.trim());
                        if (response is List<FacturaBuscada>) {
                          facturas = response;
                          // Si no encontró ningúna coincidencia.
                        } else if (response == 404) {
                          dialogMensajeProblema(context,
                              'No se encontró ningúna factura con el cai de talonario: ${_textController.text.trim()}');
                        } else if (response is MensajePeticion) {
                          MensajePeticion mensajeError = response;
                          dialogMensajeProblema(context, mensajeError.msg);
                        }
                      }
                      // Si la búsqueda es por empleado.
                    } else if (campos == 4) {
                      final response = await filtrarFacturasPorEmpleado(
                          _textController.text.trim());
                      if (response is List<FacturaBuscada>) {
                        facturas = response;
                      } else if (response == 404) {
                        dialogMensajeProblema(context,
                            'No se encontró ningúna factura con el id de empleado: ${_textController.text.trim()}');
                      } else if (response is MensajePeticion) {
                        MensajePeticion mensajeError =
                            await filtrarFacturasPorEmpleado(
                                _textController.text.trim());
                        dialogMensajeProblema(context, mensajeError.msg);
                      }
                    } else {
                      final response = await buscarFacturaPorNumero(
                          _textController.text.trim());
                      if (response is UnaFacturaBuscada) {
                        UnaFacturaBuscada facturaBuscada = response;
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: Text('Resultado de la búsqueda'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      textAlertDialogFactura(
                                          'Número de factura',
                                          'Fecha de emisión',
                                          'Empleado',
                                          facturaBuscada
                                              .unafactura.numeroFactura
                                              .toString(),
                                          facturaBuscada.unafactura.fechaFactura
                                              .toString(),
                                          facturaBuscada
                                                  .unafactura.empleado.nombre +
                                              ' ' +
                                              facturaBuscada.unafactura.empleado
                                                  .apellido),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      textAlertDialogFactura(
                                          'Nombre de cliente',
                                          'RTN',
                                          'CAI',
                                          facturaBuscada
                                              .unafactura.cliente.nombreCliente
                                              .toString(),
                                          facturaBuscada.unafactura.cliente.rtn
                                              .toString(),
                                          facturaBuscada
                                              .unafactura.talonario.cai),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      textAlertDialogFactura(
                                          'Total de factura',
                                          '',
                                          '',
                                          facturaBuscada
                                              .unafactura.totalFactura,
                                          '',
                                          ''),
                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Ver factura')),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cerrar')),
                                  ],
                                ));
                        // facturas.clear();
                        // facturas.add(factura);
                        setState(() {});
                      } else if (response == 404) {
                        dialogMensajeProblema(context,
                            'No se encontró ningún resultado para la factura con número: ${_textController.text.trim()}');
                      }
                    }
                    // Si está vacío indica la alerta.
                  } else {
                    dialogMensajeProblema(
                        context, 'El campo de búsqueda está vacío.');
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
                        CabeceraDeTabla(size: size),
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

  Future<dynamic> dialogMensajeProblema(BuildContext context, String texto) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(texto),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cerrar'))
              ],
            ));
  }

  RichText textAlertDialogFactura(String campo1, String campo2, String campo3,
      String atributo1, String atributo2, String atributo3) {
    return RichText(
        text: TextSpan(text: '     ' + campo1 + ': ', children: <TextSpan>[
      TextSpan(
          text: atributo1,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
      (campo2.isNotEmpty)
          ? TextSpan(text: '     ' + campo2 + ': ')
          : TextSpan(),
      (campo2.isNotEmpty)
          ? TextSpan(
              text: atributo2,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600))
          : TextSpan(),
      (campo3.isNotEmpty)
          ? TextSpan(text: '     ' + campo3 + ': ')
          : TextSpan(),
      (campo3.isNotEmpty)
          ? TextSpan(
              text: atributo3,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600))
          : TextSpan(),
    ]));
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
            Expanded(
              flex: 1,
              child: Text(
                factura.totalFactura,
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                factura.nombreEmpleado,
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
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
            Expanded(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MostrarFactura(numeroFactura: factura.numeroFactura)));
                    },
                    child: Icon(Icons.visibility)))
          ],
        ));
  }

  int retornarOpcion(int opcion) {
    return opcion;
  }
}

class CamposDeBusqueda extends StatefulWidget {
  const CamposDeBusqueda({
    Key? key,
    required TextEditingController textController,
    required this.campo,
    required this.textController2,
    required this.callback,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;
  final TextEditingController textController2;
  final int campo;
  final IntCallback callback;

  @override
  State<CamposDeBusqueda> createState() => _CamposDeBusquedaState();
}

class _CamposDeBusquedaState extends State<CamposDeBusqueda> {
  String label = 'Nombre de cliente';
  int opciones = 0;
  bool primera = true;
  bool primera2 = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.campo == 1) {
      if (primera) {
        primera = false;
        primera2 = true;
        opciones = 0;
        label = 'Nombre de cliente';
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: widget._textController,
            onChanged: (value) {},
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: label,
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  label = 'Nombre de cliente';
                  opciones = 0;
                  widget.callback(opciones);
                  setState(() {});
                },
                child: Text('Nombre de cliente'),
                style: ButtonStyle(
                  backgroundColor: (opciones == 0)
                      ? MaterialStateProperty.all(Colors.blue)
                      : MaterialStateProperty.all(Colors.grey),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  label = 'RTN';
                  opciones = 1;
                  widget.callback(opciones);
                  setState(() {});
                },
                child: Text('RTN'),
                style: ButtonStyle(
                  backgroundColor: (opciones == 1)
                      ? MaterialStateProperty.all(Colors.blue)
                      : MaterialStateProperty.all(Colors.grey),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  label = 'DNI';
                  opciones = 2;
                  widget.callback(opciones);
                  setState(() {});
                },
                child: Text('DNI'),
                style: ButtonStyle(
                  backgroundColor: (opciones == 2)
                      ? MaterialStateProperty.all(Colors.blue)
                      : MaterialStateProperty.all(Colors.grey),
                ),
              ),
            ],
          )
        ],
      );
    } else if (widget.campo == 2) {
      primera = true;
      primera2 = true;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: widget._textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Fecha 1',
              hintText: 'YYYY-MM-DD',
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: widget.textController2,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Fecha2',
              hintText: 'YYYY-MM-DD',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
                text: 'Puede realizar la búsqueda especificando la ',
                children: <TextSpan>[
                  TextSpan(
                      text: 'fecha 1',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                  TextSpan(text: ' o la '),
                  TextSpan(
                      text: 'fecha 1',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                  TextSpan(text: ' y '),
                  TextSpan(
                      text: 'fecha 2.',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                  TextSpan(text: ' El formato'),
                  TextSpan(
                      text: ' YYYY-MM-DD ',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                  TextSpan(text: 'tiene la siguiente forma'),
                  TextSpan(
                      text: ' 2022-12-28 ',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                ]),
          )
        ],
      );
    } else if (widget.campo == 3) {
      if (primera2) {
        opciones = 0;
        label = 'Id de talonario';
        primera2 = false;
        primera = true;
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: widget._textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: label,
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  label = 'Id de talonario';
                  opciones = 0;
                  widget.callback(opciones);
                  setState(() {});
                },
                child: Text('Id de talonario'),
                style: ButtonStyle(
                  backgroundColor: (opciones == 0)
                      ? MaterialStateProperty.all(Colors.blue)
                      : MaterialStateProperty.all(Colors.grey),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  label = 'CAI';
                  opciones = 1;
                  widget.callback(opciones);
                  setState(() {});
                },
                child: Text('CAI'),
                style: ButtonStyle(
                  backgroundColor: (opciones == 1)
                      ? MaterialStateProperty.all(Colors.blue)
                      : MaterialStateProperty.all(Colors.grey),
                ),
              ),
            ],
          )
        ],
      );
    } else if (widget.campo == 4) {
      primera = true;
      primera2 = true;
      return TextField(
        controller: widget._textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Id de empleado',
        ),
      );
    } else {
      primera = true;
      primera2 = true;
      return TextField(
        controller: widget._textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Número de factura',
        ),
      );
    }
  }
}
