import 'package:flutter/material.dart';
import 'package:soft_frontend/screens/talonarios/themes/app_theme.dart';
import 'package:soft_frontend/services/sucursal.service.dart';

import '../../models/sucursal.model.dart';

class SucursalScreen extends StatefulWidget {
  const SucursalScreen({Key? key}) : super(key: key);

  @override
  State<SucursalScreen> createState() => _SucursalScreenState();
}

class _SucursalScreenState extends State<SucursalScreen> {
  late Future<Sucursal> sucursal;
  var nombreSucursal = TextEditingController();
  var lemaSucursal = TextEditingController();
  var direccion = TextEditingController();
  var telefono = TextEditingController();
  var email = TextEditingController();
  var rtn = TextEditingController();
  var logo = TextEditingController();

  @override
  void initState() {
    super.initState();
    sucursal = getSucursal(1);
    sucursal.then((value) {
      print(value.sucursal.nombreSucursal);
      setState(() {
        nombreSucursal.text = value.sucursal.nombreSucursal;
        lemaSucursal.text = value.sucursal.lemaSucursal;
        direccion.text = value.sucursal.direccion;
        telefono.text = value.sucursal.telefono;
        email.text = value.sucursal.email;
        rtn.text = value.sucursal.rtn;
        logo.text = value.sucursal.logo;
      });
    });
  }

  // _getSucursal() async {
  //   sucursal =  getSucursal(1);
  //   nombreSucursal.text = sucursal!.nombreSucursal;
  //   lemaSucursal.text = sucursal!.lemaSucursal;
  //   print(lemaSucursal.text);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text('Mantenimiento | Sucursal'),
      ),
      body: Column(
        children: [
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              decoration: InputDecoration(label: Text('Nombre Sucursal')),
              controller: nombreSucursal,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              decoration: InputDecoration(label: Text('Lema Sucursal')),
              controller: lemaSucursal,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              decoration: InputDecoration(label: Text('Dirección')),
              controller: direccion,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              decoration: InputDecoration(label: Text('Teléfono')),
              controller: telefono,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              decoration: InputDecoration(label: Text('Email')),
              controller: email,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              decoration: InputDecoration(label: Text('RTN')),
              controller: rtn,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              decoration: InputDecoration(label: Text('URL logo')),
              controller: logo,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: TextButton(
                  style: AppTheme.lightTheme.textButtonTheme.style,
                  onPressed: () {
                    Future<String> actualizar = updateSucursal(
                        1,
                        nombreSucursal.text,
                        lemaSucursal.text,
                        direccion.text,
                        telefono.text,
                        email.text,
                        rtn.text,
                        logo.text);
                    actualizar.then((value) {
                      setState(() {
                        getSucursal(1);
                      });
                      _Alerta(context, value);
                    });
                  },
                  child: Text('Guardar')),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> _Alerta(BuildContext context, String mensaje) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (buildContext) {
          Future.delayed(Duration(seconds: 2)).then((value) {
            Navigator.pop(context);
          });
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            title: Text(
              'Alerta',
              style: TextStyle(color: AppTheme.primaryColor),
            ),
            content: Text(mensaje),
          );
        });
  }
}
