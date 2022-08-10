import 'package:flutter/material.dart';
import 'package:soft_frontend/models/tipoproducto.model.dart';
import '../services/tipoproducto.service.dart';
import '../screens/tipoproducto/tipoproducto.screen.dart' as global;

var estaCorrecto;
bool controladorCrearTipoProducto(
    String tipoproducto,
    String descripcionProducto,
    String isvTipoProducto,
    context
    ){
  bool funciona = false;
  Tipoproducto tipoProducto = Tipoproducto();
  Future <Tipoproducto?>  producto2 = crearTipoProductoController(tipoproducto, descripcionProducto, isvTipoProducto, context);
  if (producto2 != null){
    funciona = true;
  } else {
    funciona = false;
  }
  return funciona;
}
Future<Tipoproducto?>crearTipoProductoController(
    String tipoproducto2,
    String descripcionProducto,
    String isvTipoProducto,
    context) async {
  if (tipoproducto2.isNotEmpty &&
      descripcionProducto.isNotEmpty &&
      isvTipoProducto.isNotEmpty) {
      List<Tipoproducto?> producto = await crearTipoProducto2(tipoproducto2, descripcionProducto, isvTipoProducto, context);
    if (producto != null) {
       _ventanaExito(context);
    } else {
      _ventanaError(context);
    }
  } else {
    _ventanaError(context);
  }
}


Future<Tipoproducto?> actualizarTipoProductoController(
    String id,
    String tipoproducto2,
    String descripcionProducto,
    String isvTipoProducto,
    context) async {
  if (tipoproducto2.isNotEmpty &&
      descripcionProducto.isNotEmpty &&
      isvTipoProducto.isNotEmpty
      ) {
    List<Tipoproducto?> producto = await ActualizarTipoProducto2(id, tipoproducto2, descripcionProducto, isvTipoProducto, context );
    if (producto != null) {
            
    } else {}
  } else {
    _ventanaError(context);          
  }
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