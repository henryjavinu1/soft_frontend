import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:soft_frontend/models/Producto.model.dart';
import 'package:soft_frontend/services/producto.service.dart';
void TipoProducto() {
  runApp(const PantallaProducto());
}

class PantallaProducto extends StatelessWidget {
  const PantallaProducto({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  List<Producto> tipos = <Producto> [];
  List<Producto> tiposN = <Producto> [];

  @override
  void initState(){
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
                  const SizedBox(height: 20),
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
                                    _ventanaActualizar(context);
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
                                    _ventanaActualizar(context);
                                  },
                                  child: Text('Agregar Tipo de producto'),
                                  padding: EdgeInsets.all(25),
                                ))
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 120,
                                  height: 80,
                                  margin: EdgeInsets.all(5),
                                  child: RaisedButton(
                                    onPressed: () {
                                      _ventanaActualizar(context);
                                    },
                                    child: Text('Modificar existencia'),
                                    padding: EdgeInsets.all(25),
                                  ))
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: 900,
                  height: 500,
                  child: ListView.builder(
                    itemBuilder: (context, index){
                      return index == 0 ? _searchBar(): _listItem(index - 1);
                    },
                    itemCount: tiposN.length + 1,
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Buscar tipo producto'
        ),
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
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children:[
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
                            )
                          ),
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
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.all(5),
                              child: RaisedButton(
                                onPressed: () => crearProducto(
                                    codigoProductoController.text,
                                    nombreProductoController.text,
                                    precioProductoController.text,
                                    cantidadProductoController.text,
                                    isvProductoController.text,
                                    descProductoController.text,
                                    isExcentoController.text,
                                    idTipoProductoController.text,
                                    context),
                                child: Text('Guardar'),
                                padding: EdgeInsets.all(10),
                              )
                            ),
                          ]),
                    ),
                  ),
                ]
              ),
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

  void _ventanaActualizar(BuildContext context) {
    var idTipoProductoController = TextEditingController();
    var tipoProducto2Controller = TextEditingController();
    var descripcion2ProductoController = TextEditingController();
    var isvTipoProducto2Controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Container(
              width: 500,
              color: Colors.white,
              child: Column (
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "id Producto",
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
                      Text(
                        "Tipo de Producto",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextFormField(
                        controller: tipoProducto2Controller,
                        decoration:
                        InputDecoration(border: UnderlineInputBorder()),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Descripción",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextFormField(
                        controller: descripcion2ProductoController,
                        decoration:
                        InputDecoration(border: UnderlineInputBorder()),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "ISV",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextFormField(
                        controller: isvTipoProducto2Controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Escribir en valor decimal.'),
                      ),
                      Container(
                          width: 80,
                          height: 40,
                          margin: EdgeInsets.all(5),
                          /*
                          child: RaisedButton(
                            onPressed: () => ActualizarTipoProducto(
                                idTipoProductoController.text,
                                tipoProducto2Controller.text,
                                descripcion2ProductoController.text,
                                isvTipoProducto2Controller.text,
                                context),
                            child: Text('Actualizar'),
                            padding: EdgeInsets.all(10),
                          )

                           */
                          ),

                      SizedBox(
                        height: 40,
                      ),
                    ]),
                ],
              ),
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
                        "Tipo de Producto",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextFormField(
                        controller: tipoProductoController,
                        decoration:
                        InputDecoration(border: UnderlineInputBorder()),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Descripción",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextFormField(
                        controller: descripcionProductoController,
                        decoration:
                        InputDecoration(border: UnderlineInputBorder()),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "ISV",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextFormField(
                        controller: isvImpuestoController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Escribir en valor decimal.'),
                      ),
                      SizedBox(
                        height: 40,
                      ),]),
              ),
            ),
          ],
        );
      },
    );
  }

  _listItem(index) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text(
              tiposN[index].nombreProducto.toString(),
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              tiposN[index].precioProducto.toString(),
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              tiposN[index].cantidadProducto.toString(),
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
