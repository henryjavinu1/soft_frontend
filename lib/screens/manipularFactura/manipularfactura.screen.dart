import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:soft_frontend/models/models.dart';
import 'package:soft_frontend/screens/mostrarUnaFactura/mostrarunafactura.screen.dart';
import 'package:soft_frontend/screens/manipularFactura/components/cabeceradetabla.component.dart';
import '../../controllers/manipularfactura.controller.dart';

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
  List<FacturaBuscada> facturasTemp = [];
  int campos = 1000;
  int _atributoSeleccionado = 0;
  bool mostrarListaFacturasTemporal = false;


  @override
  void initState() {
    super.initState();
    // _cargarFact();
  }

  _cargarFact() async {
    // facturas = await traerFactura();
    setState(() {});
    // print(facturas.length);
  }

  set intSele(int value) => setState(() => _atributoSeleccionado = value);

  @override
  Widget build(BuildContext context) {
    // print('campos: $campos');
    // print('Atributo: $_atributoSeleccionado');
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: listarFacturas(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if ((snapshot.connectionState == ConnectionState.done) &&
              (snapshot.data is ManipularFacturaResponse)) {
            ManipularFacturaResponse response = snapshot.data;
            facturas = response.facturas;
            return Scaffold(
              backgroundColor: Color.fromARGB(255, 243, 243, 243),
              body: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                    horizontal: size.width * 0.03),
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
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              switch (value) {
                                case 0:
                                  campos = 0;
                                  _atributoSeleccionado = 0;
                                  hintText = 'Buscar por número de factura';
                                  facturasTemp.clear();
                                  mostrarListaFacturasTemporal = false;
                                  break;
                                case 1:
                                  campos = 1;
                                  _atributoSeleccionado = 0;
                                  hintText = 'Filtrar por cliente';
                                  facturasTemp.clear();
                                  mostrarListaFacturasTemporal = false;
                                  break;
                                case 2:
                                  campos = 2;
                                  _atributoSeleccionado = 0;
                                  hintText = 'Filtrar por fecha';
                                  facturasTemp.clear();
                                  mostrarListaFacturasTemporal = false;
                                  break;
                                case 3:
                                  campos = 3;
                                  _atributoSeleccionado = 0;
                                  hintText = 'Filtrar por talonario';
                                  facturasTemp.clear();
                                  mostrarListaFacturasTemporal = false;
                                  break;
                                case 4:
                                  campos = 4;
                                  _atributoSeleccionado = 0;
                                  hintText = 'Filtrar por empleado';
                                  facturasTemp.clear();
                                  mostrarListaFacturasTemporal = false;
                                  break;
                                default:
                              }
                              _textController.clear();
                              _textController2.clear();
                              setState(() {});
                            },
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            child: CamposDeBusqueda(
                                textController: _textController,
                                textController2: _textController2,
                                campo: campos, atributoEscogido: _atributoSeleccionado,
                                callback: (val) => setState(
                                    () => _atributoSeleccionado = val)),
                          )),
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  // print('campos y atributo de el btn: $campos & $_atributoSeleccionado');
                                  // Valida si el campo de búsqueda está vacío.
                                  if (_textController.text.trim().isNotEmpty) {
                                    switch (campos) {
                                      //Búsqueda por cliente.
                                      case 1:
                                        // Tipo de atributo de cliente par hacer la búsqueda.
                                        switch (_atributoSeleccionado) {
                                          // Por nombre de cliente
                                          case 0:
                                            facturasTemp.clear();
                                            await filtrarFacturasPorNombreCliente(
                                                _textController,
                                                (val) =>
                                                    setState(() => facturasTemp = val),
                                                context);
                                            break;
                                          // Por RTN
                                          case 1:
                                            facturasTemp.clear();
                                            await filtrarFacturasPorRTNCliente(
                                                _textController,
                                                (val) =>
                                                    setState(() => facturasTemp = val),
                                                context);
                                            break;
                                          // Por DNI
                                          case 2:
                                            facturasTemp.clear();
                                            await filtrarFacturasPorDNICliente(
                                                _textController,
                                                (val) =>
                                                    setState(() => facturasTemp = val),
                                                context);
                                            break;
                                          default:
                                        }
                                        break;
                                      //Búsqueda por fecha
                                      case 2:
                                        facturasTemp.clear();
                                        await filtrarFacturasPorFechaController(
                                            _textController,
                                            _textController2,
                                            (val) => setState(() => facturasTemp = val),
                                            context);
                                        break;
                                      //Búsqueda por talonario
                                      case 3:
                                        if (_atributoSeleccionado == 0) {
                                          facturasTemp.clear();
                                          await filtrarFacturasPorIdTalonario(
                                              _textController,
                                              (val) =>
                                                  setState(() => facturasTemp = val),
                                              context);
                                          // Si la búsqueda es por CAI
                                        } else if (_atributoSeleccionado == 1) {
                                          facturasTemp.clear();
                                          await filtrarFacturasPorCAI(
                                              _textController,
                                              (val) =>
                                                  setState(() => facturasTemp = val),
                                              context);
                                        }
                                        break;
                                      // Búsqueda por empleado
                                      case 4:
                                        facturasTemp.clear();
                                        await filtrarFacturasPorIdEmpleado(
                                            _textController,
                                            (val) => setState(() => facturasTemp = val),
                                            context);
                                        break;
                                      // Búsqueda por número de factura
                                      default:
                                        await buscarFacturaPorNumeroFact(
                                            _textController, size, context);
                                    }
                                    if (facturasTemp.isNotEmpty) {
                                      mostrarListaFacturasTemporal = true;
                                      setState(() {});
                                    }
                                    // Si el campo de búsqueda está vacío indica la alerta.
                                  } else {
                                    dialogMensajeProblema(context,
                                        'El campo de búsqueda está vacío.');
                                  }
                                },
                                child: Text(
                                  'Buscar',
                                  style: GoogleFonts.lato(),
                                ),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: size.width * 0.015,
                                          vertical: 26)),
                                ),
                              ),
                              (mostrarListaFacturasTemporal)?SizedBox(height: 10,):SizedBox(),
                              (mostrarListaFacturasTemporal)?ElevatedButton(
                                onPressed: () async {
                                  mostrarListaFacturasTemporal = false;
                                  facturasTemp.clear();
                                  setState(() {
                                  });
                                },
                                child: Text(
                                  'Limpiar',
                                  style: GoogleFonts.lato(),
                                ),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: size.width * 0.015,
                                          vertical: 26)),
                                ),
                              ):SizedBox(),
                            ],
                          )
                        ]),
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
          } else if (snapshot.data == 2 &&
              snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Ocurrió un error al hacer la conexión con el servidor, contáctese con el administrador o presione recargar.'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text('Recargar'),
                      ),
                      SizedBox(width: 5,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Regresar'),
                      ),
                    ],
                  )
                ],
              ),
            ));
          } else if (snapshot.data == 500 && snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Ocurrió un error al hacer la conexión con el servidor, contáctese con el administrador o presione recargar.'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text('Recargar'),
                      ),
                      SizedBox(width: 5,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Regresar'),
                      ),
                    ],
                  )
                ],
              ),
            ));
          } else {
            return Scaffold(
                body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: size.width * 0.05,
                      height: size.width * 0.05,
                      child: CircularProgressIndicator()),
                  Text('Cargando, espere un momento.')
                ],
              ),
            ));
          }
        });
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

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (_, i) => Divider(),
      itemCount: (mostrarListaFacturasTemporal)?facturasTemp.length:facturas.length,
      itemBuilder: (_, i) => _facturaItemList((mostrarListaFacturasTemporal)?facturasTemp[i]:facturas[i]),
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
                factura.totalFactura.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                factura.nombreEmpleado.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                (factura.cai ==
                        'No existe un talonario asociado a este CAI por favor comuniquese con el administrador.')
                    ? 'N/A'
                    : factura.cai.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                factura.nombreCliente.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                factura.rtn.toString(),
                style: GoogleFonts.lato(fontSize: size.width * 0.009),
              ),
            ),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MostrarFactura(
                                  numeroFactura: int.parse(factura.numeroFactura.toString()))));
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
    required this.callback, required this.atributoEscogido,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;
  final TextEditingController textController2;
  final int campo;
  final IntCallback callback;
  final int atributoEscogido;

  @override
  State<CamposDeBusqueda> createState() => _CamposDeBusquedaState();
}

class _CamposDeBusquedaState extends State<CamposDeBusqueda> {
  String label = 'Nombre de cliente';
  late int opciones;
  bool primera = true;
  bool primera2 = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    opciones = widget.atributoEscogido;
    // print('opciones desde el build: $opciones');
    if (widget.campo == 1) {
      if (opciones == 0) {
        label = 'Nombre de cliente';
      } else if (opciones == 1) {
        label = 'RTN';
      } else if (opciones == 2) {
        label = 'DNI';
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: widget._textController,
            onChanged: (value) {},
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
      if (opciones == 0) {
        label = 'Id de talonario';
      } else if (opciones == 1) {
        label = 'CAI';
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
      return TextField(
        controller: widget._textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Id de empleado',
        ),
      );
    } else {
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
