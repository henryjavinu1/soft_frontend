import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:soft_frontend/models/tipoproducto.model.dart';
import 'package:soft_frontend/services/tipoproducto.service.dart';
void TipoProducto() {
  runApp(const PantallaTipoProducto());
}

class PantallaTipoProducto extends StatelessWidget {
  const PantallaTipoProducto({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tipo Producto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tipo Producto'),
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
  List<Tipoproducto> tipos = <Tipoproducto> [];
  List<Tipoproducto> tiposN = <Tipoproducto> [];

  Future<List<Tipoproducto>> fetchNotes2() async{
    var data = [];
    var url = Uri.parse("http://localhost:8080/api/producto/mostrartipos");
    var response = await http.get(url);
    List<Tipoproducto> users = [];

    try {
      if (response.statusCode == 200) {
        var units = (json.decode(response.body) as Map<String, dynamic>)["tipoProducto"];
        for(var u in units){
          Tipoproducto user = Tipoproducto(id: u["id"],tipoProducto: u["tipoProducto"],descripcionProducto: u["descripcionProducto"], isvTipoProducto: u["isvTipoProducto"]);
          users.add(user);
        }
      } else {
        print('Api error');
      }
    } on Exception catch (e){
      print('error: $e');
    }
    return users;
  }

  @override
  void initState(){
    fetchNotes2().then((value) {
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
                    padding: const EdgeInsets.all(30.0),
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
              var noteTitle = note.tipoProducto.toString().toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  void _ventanaCrearTipoProducto(BuildContext context) {
    var tipoProductoController = TextEditingController();
    var descripcionProductoController = TextEditingController();
    var isvTipoProductoController = TextEditingController();

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
                        controller: isvTipoProductoController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Escribir en valor decimal.'),
                      ),
                      Container(
                          width: 80,
                          height: 40,
                          margin: EdgeInsets.all(5),
                          child: RaisedButton(
                            onPressed: () => crearTipoProducto(
                                tipoProductoController.text,
                                descripcionProductoController.text,
                                isvTipoProductoController.text,
                                context),
                            child: Text('Guardar'),
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
                          child: RaisedButton(
                            onPressed: () => EliminarTipoProducto(
                                idTipoProductoController.text,
                                context),
                            child: Text('Eliminar'),
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
                          child: RaisedButton(
                            onPressed: () => ActualizarTipoProducto(
                                idTipoProductoController.text,
                                tipoProducto2Controller.text,
                                descripcion2ProductoController.text,
                                isvTipoProducto2Controller.text,
                                context),
                            child: Text('Actualizar'),
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
              tiposN[index].tipoProducto.toString(),
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              tiposN[index].descripcionProducto.toString(),
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              tiposN[index].isvTipoProducto.toString(),
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
