//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:soft_frontend/models/arqueo.model.dart';
import 'package:soft_frontend/services/arqueo.service.dart';

class MostrarArqueo extends StatefulWidget {
  const MostrarArqueo({Key? key}) : super(key: key);
  @override
  State<MostrarArqueo> createState() => _MostrarArqueoState();
}

class _MostrarArqueoState extends State<MostrarArqueo> {
  /*var idController = TextEditingController();
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
  var idSesionController = TextEditingController();*/
  //cargar la lista con los datos del archivo arqueo.service.dart
  List<Arqueo> arqueos = [];
  @override
  void initState() {
    super.initState();
    _cargarArqueos();
  }

  _cargarArqueos() async {
    this.arqueos = await mostrarArqueo();
    setState(() {});
  }

  @override
  //crear una tabla usando un datatable
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mostrar Arqueo'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text('ID'),
            ),
            DataColumn(
              label: Text('Fecha Inicio'),
            ),
            DataColumn(
              label: Text('Fecha Final'),
            ),
            DataColumn(
              label: Text('Efectivo Apertura'),
            ),
            DataColumn(
              label: Text('Efectivo Cierre'),
            ),
            DataColumn(
              label: Text('Otros Pagos'),
            ),
            DataColumn(
              label: Text('Venta Credito'),
            ),
            DataColumn(
              label: Text('Venta Total'),
            ),
            DataColumn(
              label: Text('Efectivo Total'),
            ),
            DataColumn(
              label: Text('Created At'),
            ),
            DataColumn(
              label: Text('Updated At'),
            ),
            DataColumn(
              label: Text('Id Usuario'),
            ),
            DataColumn(
              label: Text('Id Sesion'),
            ),
          ],
          rows: arqueos
              .map(
                (arqueo) => DataRow(
                  cells: [
                    DataCell(
                      Text(arqueo.id.toString()),
                    ),
                    DataCell(
                      Text(arqueo.fechaInicio.toString()),
                    ),
                    DataCell(
                      Text(arqueo.fechaFinal.toString()),
                    ),
                    DataCell(
                      Text(arqueo.efectivoApertura.toString()),
                    ),
                    DataCell(
                      Text(arqueo.efectivoCierre.toString()),
                    ),
                    DataCell(
                      Text(arqueo.otrosPagos.toString()),
                    ),
                    DataCell(
                      Text(arqueo.ventaCredito.toString()),
                    ),
                    DataCell(
                      Text(arqueo.ventaTotal.toString()),
                    ),
                    DataCell(
                      Text(arqueo.efectivoTotal.toString()),
                    ),
                    DataCell(
                      Text(arqueo.createdAt.toString()),
                    ),
                    DataCell(
                      Text(arqueo.updatedAt.toString()),
                    ),
                    DataCell(
                      Text(arqueo.idUsuario.toString()),
                    ),
                    DataCell(
                      Text(arqueo.idSesion.toString()),
                    ),
                  ],
                ),
              )
              .toList(),
          border: TableBorder(
            horizontalInside: BorderSide(
              color: Colors.black,
              width: 1,
            ),
            verticalInside: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          columnSpacing: 15,
        ),
      ),
    );
  }
}
