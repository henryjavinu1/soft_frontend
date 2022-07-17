import 'package:flutter/material.dart';
import 'package:soft_frontend/screens/talonarios/models/talonarios_response.dart';
import 'package:soft_frontend/screens/talonarios/themes/app_theme.dart';
import 'package:soft_frontend/services/talonarios.service.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class TalonariosScreen extends StatefulWidget {
  const TalonariosScreen({Key? key}) : super(key: key);

  @override
  State<TalonariosScreen> createState() => _TalonariosScreenState();
}

class _TalonariosScreenState extends State<TalonariosScreen> {
  List<Talonario> talonarios = [];
  @override
  void initState() {
    super.initState();
    this._getTalonarios();
  }

  _getTalonarios() async {
    this.talonarios = await getTalonarios();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: const Text('Mantenimiento | Talonarios'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.01, horizontal: height * 0.02),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Crear Talonario'),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: AppTheme.primaryColor),
                )
              ],
            ),
          ),
          const Divider(),
          DataTable(
            columns: const [
              DataColumn(
                label: Text(
                  'Rango Inicial',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Rango Inicial',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Rango Final',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'CAI',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Fecha Limite E.',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Activo',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Eliminado',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Opciones',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: List<DataRow>.generate(talonarios.length, (index) {
              final talonario = talonarios[index];
              return DataRow(cells: [
                DataCell(Text(talonario.idTalonario.toString())),
                DataCell(Text(talonario.rangoInicialFactura)),
                DataCell(Text(talonario.rangoFinalFactura)),
                DataCell(Text(talonario.cai)),
                DataCell(Text(talonario.fechaLimiteEmision.toString())),
                DataCell(
                    Text((talonario.active == true) ? 'Verdadero' : 'Falso')),
                DataCell(
                    Text((talonario.isDelete == true) ? 'Verdadero' : 'Falso')),
                DataCell(Row(
                  children: [
                    TextButton(
                        style: AppTheme.lightTheme.textButtonTheme.style,
                        onPressed: () {
                          _EditarTalonario(context, talonario);
                        },
                        child: Text('Editar')),
                    TextButton(
                        style: AppTheme.lightTheme.textButtonTheme.style,
                        onPressed: () {
                          _EliminarTalonario(context, talonario);
                        },
                        child: Text('Eliminar')),
                  ],
                )),
              ]);
            }),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _EliminarTalonario(
      BuildContext context, Talonario talonario) {
    return showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            title: Text(
              'Eliminación',
              style: TextStyle(color: AppTheme.primaryColor),
            ),
            content: SizedBox(
              height: 100,
              child: Column(
                children: [
                  Text('¿Está seguro de eliminar el talonario ' +
                      talonario.idTalonario.toString() +
                      '?'),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextButton(
                        style: AppTheme.lightTheme.textButtonTheme.style,
                        onPressed: () {
                          final resp =
                              deleteTalonario(talonario.idTalonario.toString());
                          Future.delayed(Duration(seconds: 3)).then((value) {
                            setState(() {
                              this._getTalonarios();
                            });
                            showDialog(
                                context: context,
                                builder: (buildContext) {
                                  return AlertDialog(
                                    title: Text('Atención'),
                                    content: Text(resp.toString()),
                                  );
                                });
                          });
                        },
                        child: Text('Confirmar')),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<dynamic> _EditarTalonario(BuildContext context, Talonario talonario) {
    return showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            title: Text(
              'Edición talonario: ' + talonario.idTalonario.toString(),
              style: TextStyle(color: AppTheme.primaryColor),
            ),
            content: SizedBox(
              height: 320,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: talonario.rangoInicialFactura,
                    decoration: InputDecoration(
                      label: Text('Rango Inicial'),
                    ),
                  ),
                  TextFormField(
                    initialValue: talonario.rangoFinalFactura,
                    decoration: InputDecoration(
                      label: Text('Rango Final'),
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    initialValue: talonario.cai,
                    decoration: InputDecoration(
                      label: Text('CAI'),
                    ),
                  ),
                  DateTimeField(
                    initialValue: talonario.fechaLimiteEmision,
                    decoration: InputDecoration(label: Text('Fecha Limite E.')),
                    format: DateFormat("yyyy-MM-dd"),
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                  ),
                  Row(
                    children: [
                      Text('Activo: '),
                      Switch(
                          value: talonario.active,
                          onChanged: (value) {
                            setState(() {
                              talonario.active = value;
                            });
                          }),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextButton(
                        style: AppTheme.lightTheme.textButtonTheme.style,
                        onPressed: () {},
                        child: Text('Confirmar')),
                  )
                ],
              ),
            ),
          );
        });
  }
}
