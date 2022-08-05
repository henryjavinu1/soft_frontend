import 'package:flutter/material.dart';
import 'package:soft_frontend/models/empleado.model.dart';
import '../models/Producto.model.dart';
import '../services/producto.service.dart';
import '../screens/producto/producto.screen.dart' as global;

var estaCorrecto;
bool pruebaControlador(
    String codigoProducto,
    String nombreProducto,
    String precioProducto,
    String cantidadProducto,
    String isvProducto,
    String descProducto,
    String isExcento,
    String idTipoProducto,
    context
    ){
  bool funciona = false;
  Producto producto = Producto();
  Future <Producto?>  producto2 = crearProductoController(codigoProducto, nombreProducto, precioProducto, cantidadProducto, isvProducto, descProducto, isExcento, idTipoProducto, context);
  if (producto2 != null){
    funciona = true;
  } else {
    funciona = false;
  }
  return funciona;
}
Future<Producto?> crearProductoController(
    String codigoProducto,
    String nombreProducto,
    String precioProducto,
    String cantidadProducto,
    String isvProducto,
    String descProducto,
    String isExcento,
    String idTipoProducto,
    context) async {
  if (codigoProducto.isNotEmpty &&
      nombreProducto.isNotEmpty &&
      precioProducto.isNotEmpty &&
      cantidadProducto.isNotEmpty &&
      isvProducto.isNotEmpty &&
      descProducto.isNotEmpty &&
      idTipoProducto.isNotEmpty) {
      List<Producto?> producto = await crearProducto2(codigoProducto, nombreProducto, precioProducto, cantidadProducto, isvProducto, descProducto, isExcento, idTipoProducto, context);
    if (producto != null) {
       _ventanaExito(context);
    } else {
      _ventanaError(context);
    }
  } else {
    _ventanaError(context);
  }
}


Future<Producto?> actualizaProductoController(
    String id,
    String codigoProducto,
    String nombreProducto,
    String precioProducto,
    String cantidadProducto,
    String isvProducto,
    String descProducto,
    String isExcento,
    String idTipoProducto,
    context) async {
  if (id.isEmpty &&
      codigoProducto.isNotEmpty &&
      nombreProducto.isNotEmpty &&
      precioProducto.isNotEmpty &&
      cantidadProducto.isNotEmpty &&
      isvProducto.isNotEmpty &&
      descProducto.isNotEmpty &&
      isExcento.isNotEmpty &&
      idTipoProducto.isNotEmpty) {
    List<Producto?> producto = await ActualizarProducto2(id, codigoProducto, nombreProducto, precioProducto, cantidadProducto, isvProducto, descProducto, isExcento, idTipoProducto, context );
    if (producto != null) {
            
    } else {}
  } else {
    _ventanaError(context);          
  }
}

Future<Producto?> eliminarProductoController(String id, context) async {
  List<Producto?> producto = await eliminarProducto2(id);
  print(id);
  if (producto != null) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Producto eliminado con éxito.")));
  } else {}
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
                        "Acción realizada con éxito.",
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
                              //initState();
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


  void _ventanaError(BuildContext context) {
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
                        "Ocurrio un error al realizar esta acción, intente de nuevo.",
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
                              //initState();
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