//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:soft_frontend/models/Arqueo.model.dart';

class MostrarArqueo extends StatefulWidget {
  @override
  State<MostrarArqueo> createState() => _MostrarArqueoState();
}

class _MostrarArqueoState extends State<MostrarArqueo> {
  var idController = TextEditingController();
  var fechaIncioController = TextEditingController();
  var fechaFinalController = TextEditingController();
  var efectivoAperturaController = TextEditingController();
  var efectivoCierreController = TextEditingController();
  var otrosPagosController = TextEditingController();
  var ventaCreditoController = TextEditingController();
  var ventaTotalController = TextEditingController();
  var efectivoTotalController = TextEditingController();
  var isDeleteController = TextEditingController();
  var createdAtController = TextEditingController();
  var updatedAtController = TextEditingController();
  var idUsuarioController = TextEditingController();
  var idSesionController = TextEditingController();

  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Mostrar Arqueo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    child: Text(
                      'ID',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    child: Text(
                      'Fecha Inicio',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    child: Text(
                      'Fecha Final',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    child: Text(
                      'Efectivo Apertura',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    child: Text(
                      'Efectivo Cierre',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    child: Text(
                      'Otros Pagos',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    child: Text(
                      'Venta Credito',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    child: Text(
                      'Venta Total',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    child: Text(
                      'Efectivo Total',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    child: Text(
                      'Is Delete',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    child: Text(
                      'Created At',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    child: Text(
                      'Updated At',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    child: Text(
                      'Id Usuario',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Container(
                    child: Text(
                      'Id Sesion',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: EdgeInsets.only(top: 20),
                  ),
                ],
              ),
            ),
          ),
        );
      }));
}
