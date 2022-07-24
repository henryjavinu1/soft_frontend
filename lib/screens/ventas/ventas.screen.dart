// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:soft_frontend/controllers/ventas.controller.dart';
import 'package:soft_frontend/models/IdDetalleVenta.model.dart';
import 'package:soft_frontend/models/IdVenta.model.dart';
import 'package:soft_frontend/models/ProductoBuscado.model.dart';
import 'package:soft_frontend/models/detalleventa.model.dart';
import 'package:soft_frontend/models/ventas.model.dart';

import 'package:soft_frontend/services/cliente.service.dart';
import 'package:soft_frontend/models/cliente.model.dart';
import 'package:soft_frontend/models/cliente.model.dart';
import 'package:soft_frontend/services/detalleventa.service.dart';

import '../../controllers/detalleventa.controller.dart';
import '../../services/ventas.service.dart';

class Venta extends StatefulWidget {
  const Venta({Key? key}) : super(key: key);

  @override
  State<Venta> createState() => _VentaState();
}

class _VentaState extends State<Venta> {
  var rtnController = TextEditingController();
  var dniController = TextEditingController();
  var nombreCliente = TextEditingController();
  var telCliente = TextEditingController();
  var codProductoController = TextEditingController();
  bool botonesHabilitados = false;
  int idVentaActual = 0;
  int idDetalleActual = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    mostrardetalleventa();
    mostrarVentas();
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.account_circle_rounded),
                      Text('Nombre de Usuario')
                    ],
                  ),
                  const Text('Nombre de Empresa'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('9 Jueves 2022'),
                      Text('10:00 AM'),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: 
                      TextButton(
                        onPressed: null,
                        child: Center(
                          child: ElevatedButton(
                              onPressed: () {
                                if (botonesHabilitados) {
                                  null;
                                } else {
                                  Navigator.pushNamed(context, 'crear_cliente');  
                                }
                            },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text('Agregar Cliente'),
                              ),
                              style: ButtonStyle(
                                    backgroundColor: (!botonesHabilitados)?MaterialStateProperty.all(Colors.blue):MaterialStateProperty.all(Color.fromARGB(255, 194, 194, 194)),
                                    elevation: (botonesHabilitados)?MaterialStateProperty.all(0):MaterialStateProperty.all(5.0),
                                    // foregroundColor: MaterialStateProperty.all(Colors.black)
                                    overlayColor: (botonesHabilitados)?MaterialStateProperty.all(Color.fromARGB(255, 194, 194, 194)):MaterialStateProperty.all(Color.fromARGB(255, 35, 156, 255)),
                                  ),
                              ),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Identidad de Cliente'),
                          Container(
                            width: size.width * 0.2,
                            child: TextFormField(
                              controller: dniController,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () async {
                          final respuesta = await habilitarVenta(dniController, nombreCliente, telCliente, context);
                          if (respuesta is IdVenta) {
                            idVentaActual = respuesta.id;
                            botonesHabilitados = true;
                            setState(() {
                              
                            });
                          } else {
                            botonesHabilitados = false;
                            setState(() {
                              
                            });
                          }
                        },
                        child: const Icon(Icons.search)),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Nombre de Cliente'),
                          Container(
                            width: size.width * 0.2,
                            child: TextFormField(
                              readOnly: true,
                              controller: nombreCliente,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Telefono de Cliente'),
                          Container(
                            width: size.width * 0.2,
                            child: TextFormField(
                              readOnly: true,
                              controller: telCliente,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Codigo de producto'),
                        Container(
                          width: size.width * 0.2,
                          child: TextFormField(
                            controller: codProductoController,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: ElevatedButton(
                                  onPressed: (){
                                    if (botonesHabilitados) {
                                      
                                    } else {
                                      null;
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Text('Anular'),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: (botonesHabilitados)?MaterialStateProperty.all(Colors.red):MaterialStateProperty.all(Color.fromARGB(255, 194, 194, 194)),
                                    elevation: (!botonesHabilitados)?MaterialStateProperty.all(0):MaterialStateProperty.all(5.0),
                                    // foregroundColor: MaterialStateProperty.all(Colors.black)
                                    overlayColor: (!botonesHabilitados)?MaterialStateProperty.all(Color.fromARGB(255, 194, 194, 194)):MaterialStateProperty.all(Color.fromARGB(255, 255, 72, 59)),
                                  ),
                                  ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Center(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (botonesHabilitados) {
                                      final response = await buscarProductoController(codProductoController, context);
                                      if (response is IdDetalleVenta) {
                                      
                            idDetalleActual = response.id;
              
                            setState(() {
                              
                            });
                          } else {
                           
                            setState(() {
                              
                            });
                          }  
                                      
                                    } else {
                                      //null;
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Text('Buscar Producto'),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: (botonesHabilitados)?MaterialStateProperty.all(Colors.blue):MaterialStateProperty.all(Color.fromARGB(255, 194, 194, 194)),
                                    elevation: (!botonesHabilitados)?MaterialStateProperty.all(0):MaterialStateProperty.all(5.0),
                                    // foregroundColor: MaterialStateProperty.all(Colors.black)
                                    overlayColor: (!botonesHabilitados)?MaterialStateProperty.all(Color.fromARGB(255, 194, 194, 194)):MaterialStateProperty.all(Color.fromARGB(255, 35, 156, 255)),
                                  ),
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                              child: ElevatedButton(
                                  onPressed: (){
                                    if (botonesHabilitados) {
                                      
                                    } else {
                                      null;
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Text('Realizar Venta'),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: (botonesHabilitados)?MaterialStateProperty.all(Colors.green):MaterialStateProperty.all(Color.fromARGB(255, 194, 194, 194)),
                                    elevation: (!botonesHabilitados)?MaterialStateProperty.all(0):MaterialStateProperty.all(5.0),
                                    // foregroundColor: MaterialStateProperty.all(Colors.black)
                                    overlayColor: (!botonesHabilitados)?MaterialStateProperty.all(Color.fromARGB(255, 194, 194, 194)):MaterialStateProperty.all(Color.fromARGB(255, 84, 194, 88)),
                                  ),
                                  ),
                            ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Descuento',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  '00000000.00',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Sub Total',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  '00000000.00',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Impuesto',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  '00000000.00',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Total a Cancelar',
                                  style: TextStyle(fontSize: 10),
                                ),
                                Text(
                                  '00000000.00',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: size.width * 0.7,
                    /*child: FutureBuilder(
                      future: mostrardetalleventa(),
                      builder: (BuildContext context, AsyncSnapshot snapshot){
                        
                        if ( snapshot.connectionState == ConnectionState.waiting){
                        return Center(child:  CircularProgressIndicator());
                      } else{ 
                        return _ListaDetalles( snapshot.data );

                      }
                      }
                    ),*/
                    child: Table(
                      defaultColumnWidth: FixedColumnWidth(120.0),
                      children: const [
                        TableRow(children: [
                          Text('ID'),
                          Text('Nombre'),
                          Text('Precio'),
                          Text('Cantidad'),
                          Text('ISV'),
                          Text('Descuento'),
                        ])
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListaDetalles extends StatelessWidget {
  final List<TodosLosDetalle> detalles;

  _ListaDetalles(this.detalles);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: detalles.length,
      itemBuilder: (BuildContext context, int i) {
        final detalle = detalles[i];
        return ListTile(
          title: Text('${detalle.id} ${detalle.idProducto}'),
        );
      },
    );
  }
}
