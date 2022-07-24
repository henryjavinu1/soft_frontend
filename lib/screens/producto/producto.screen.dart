import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:soft_frontend/models/Producto.model.dart';
import 'package:soft_frontend/models/buscarProducto.dart';
import 'package:soft_frontend/services/producto.service.dart';

void TipoProducto() {
  runApp(const PantallaProducto());
}

class PantallaProducto extends StatelessWidget {
  const PantallaProducto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Productos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Producto> tipos = <Producto>[];
  List<Producto> tiposN = <Producto>[];

  @override
  void initState() {
    obtenerProductos().then((value) {
      setState(() {
        tipos.addAll(value);
        tiposN.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 27.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        child: Column(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 120,
                                height: 80,
                                margin: EdgeInsets.all(5),
                                child: RaisedButton(
                                  onPressed: () {
                                    _ventanaCrearTipoProducto(context);
                                  },
                                  child: Text('Agregar'),
                                  padding: EdgeInsets.all(25),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 120,
                                height: 80,
                                margin: EdgeInsets.all(5),
                                child: RaisedButton(
                                  onPressed: () {
                                    _ventanaEliminar(context);
                                  },
                                  child: Text('Actualizar'),
                                  padding: EdgeInsets.all(25),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 120,
                                height: 80,
                                margin: EdgeInsets.all(5),
                                child: RaisedButton(
                                  onPressed: () {
                                    _ventanaEliminar(context);
                                  },
                                  child: Text('Eliminar'),
                                  padding: EdgeInsets.all(20),
                                )),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 120,
                                  height: 80,
                                  margin: EdgeInsets.all(5),
                                  child: RaisedButton(
                                    onPressed: () {
                                      _ventanaEliminar(context);
                                    },
                                    child: Text('Agregar Tipo de producto'),
                                    padding: EdgeInsets.all(25),
                                  ))),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 120,
                                  height: 80,
                                  margin: EdgeInsets.all(5),
                                  child: RaisedButton(
                                    onPressed: () {
                                      _ventanaEliminar(context);
                                    },
                                    child: Text('Modificar existencia'),
                                    padding: EdgeInsets.all(25),
                                  ))),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 1200,
                    height: 500,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return index == 0
                            ? _searchBar()
                            : _listItem(index - 1);
                      },
                      itemCount: tiposN.length + 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: 'Buscar producto'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            tiposN = tipos.where((note) {
              var noteTitle = note.nombreProducto.toString().toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  void _ventanaCrearTipoProducto(BuildContext context) {
    var idProductoController = TextEditingController();
    var codigoProductoController = TextEditingController();
    var nombreProductoController = TextEditingController();
    var precioProductoController = TextEditingController();
    var cantidadProductoController = TextEditingController();
    var isvProductoController = TextEditingController();
    var descProductoController = TextEditingController();
    var isExcentoController = TextEditingController();
    var idTipoProductoController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Container(
              color: Colors.white,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: 350,
                  height: 450,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Código Producto",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            controller: codigoProductoController,
                            decoration:
                                InputDecoration(border: UnderlineInputBorder()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Precio",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            controller: precioProductoController,
                            decoration:
                                InputDecoration(border: UnderlineInputBorder()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "ISV",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                              controller: isvProductoController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Excento",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            controller: isExcentoController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.all(5),
                          ),
                        ]),
                  ),
                ),
                Container(
                  width: 350,
                  height: 450,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Nombre del producto",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            controller: nombreProductoController,
                            decoration:
                                InputDecoration(border: UnderlineInputBorder()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Cantidad en existencia",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            controller: cantidadProductoController,
                            decoration:
                                InputDecoration(border: UnderlineInputBorder()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Descuento",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            controller: descProductoController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Id tipo producto",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            controller: idTipoProductoController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.all(5),
                              child: RaisedButton(
                                onPressed: () {
                                  crearProducto(
                                      codigoProductoController.text,
                                      nombreProductoController.text,
                                      precioProductoController.text,
                                      cantidadProductoController.text,
                                      isvProductoController.text,
                                      descProductoController.text,
                                      isExcentoController.text,
                                      idTipoProductoController.text,
                                      context);
                                  Navigator.pop(context);
                                  _ventanaExito(context);
                                },
                                child: Text('Guardar'),
                                padding: EdgeInsets.all(10),
                              )),
                        ]),
                  ),
                ),
              ]),
            ),
          ],
        );
      },
    );
  }

  void _ventanaEliminar(BuildContext context) {
    var idTipoProductoController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Container(
              width: 500,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "id Tipo de Producto",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextFormField(
                        controller: idTipoProductoController,
                        decoration:
                            InputDecoration(border: UnderlineInputBorder()),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        margin: EdgeInsets.all(5),
                        /*
                          child: RaisedButton(
                            onPressed: () => EliminarTipoProducto(
                                idTipoProductoController.text,
                                context),
                            child: Text('Eliminar'),
                            padding: EdgeInsets.all(10),
                          )

                           */
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ]),
              ),
            ),
          ],
        );
      },
    );
  }

  void _ventanaExito(BuildContext context) {
    var idTipoProductoController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Container(
              width: 500,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Accion realizada con éxito.",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                          width: 80,
                          height: 40,
                          margin: EdgeInsets.all(5),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                            padding: EdgeInsets.all(10),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                    ]),
              ),
            ),
          ],
        );
      },
    );
  }

  void _ventanaActualizar(BuildContext context, String idProductoP, String codigoProductoP, String nombreProductoP, String cantidadProductoP, String precioProductoP, String isvProductoP, String descProductoP, String isExcentoP, String idTipoProductoP) {
    late TextEditingController idProducto = TextEditingController(text: idProductoP); 
    late TextEditingController codigoProducto = TextEditingController(text: codigoProductoP); 
    late TextEditingController nombreProducto = TextEditingController(text: nombreProductoP); 
    late TextEditingController precioProducto = TextEditingController(text: precioProductoP); 
    late TextEditingController cantidadProducto = TextEditingController(text: cantidadProductoP); 
    late TextEditingController isvProducto = TextEditingController(text: isvProductoP); 
    late TextEditingController descProducto = TextEditingController(text: descProductoP); 
    late TextEditingController isExcento = TextEditingController(text: isExcentoP);
    late TextEditingController idTipoProducto = TextEditingController(text: idTipoProductoP);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Container(
              color: Colors.white,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: 350,
                  height: 450,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Código Producto",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            controller: codigoProducto,
                            decoration:
                                InputDecoration(border: UnderlineInputBorder()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Precio",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            controller: precioProducto,
                            decoration:
                                InputDecoration(border: UnderlineInputBorder()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "ISV",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                              controller: isvProducto,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Excento",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            controller: isExcento,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.all(5),
                          ),
                        ]),
                  ),
                ),
                Container(
                  width: 350,
                  height: 450,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Nombre del producto",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            controller: nombreProducto,
                            decoration:
                                InputDecoration(border: UnderlineInputBorder()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Cantidad en existencia",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            controller: cantidadProducto,
                            decoration:
                                InputDecoration(border: UnderlineInputBorder()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Descuento",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            controller: descProducto,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Id tipo producto",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          TextFormField(
                            controller: idTipoProducto,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          Container(
                              width: 100,
                              height: 50,
                              margin: EdgeInsets.all(5),
                              child: RaisedButton(
                                onPressed: () {
                                  crearProducto(
                                      codigoProducto.text,
                                      nombreProducto.text,
                                      precioProducto.text,
                                      cantidadProducto.text,
                                      isvProducto.text,
                                      descProducto.text,
                                      isExcento.text,
                                      idTipoProducto.text,
                                      context);
                                  Navigator.pop(context);
                                  _ventanaExito(context);
                                },
                                child: Text('Actualizar'),
                                padding: EdgeInsets.all(10),
                              )),
                        ]),
                  ),
                ),
              ]),
            ),
          ],
        );
      },
    );
    
  }

  void _ventanaProducto(BuildContext context) {
    var tipoProductoController = TextEditingController();
    var descripcionProductoController = TextEditingController();
    var isvImpuestoController = TextEditingController();

    
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 16.0, right: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Expanded(
              flex: 1,
              child: Text(
                tiposN[index].codigoProducto.toString(),
                style: GoogleFonts.lato(fontSize: 15),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                tiposN[index].nombreProducto.toString(),
                style: GoogleFonts.lato(fontSize: 15),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "L. " + tiposN[index].precioProducto.toString() ,
                style: GoogleFonts.lato(fontSize: 15),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                tiposN[index].cantidadProducto.toString(),
                style: GoogleFonts.lato(fontSize: 15),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                tiposN[index].isvProducto.toString(),
                style: GoogleFonts.lato(fontSize: 15),
              ),
            ),

            Expanded(
              flex: 1,
              child: TextButton(
                child: Text("Actualizar"),
                onPressed: (){ 
                  _ventanaActualizar(context, tiposN[index].id.toString() ,tiposN[index].codigoProducto.toString(), tiposN[index].nombreProducto.toString(), tiposN[index].precioProducto.toString(), tiposN[index].cantidadProducto.toString(), tiposN[index].isvProducto.toString(), tiposN[index].descProducto.toString(), tiposN[index].isExcento.toString(), tiposN[index].idTipoProducto.toString());
                  },
                )
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                child: Text("Eliminar"),
                onPressed: (){ 
                  _ventanaEliminar(context);
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}
