import 'package:flutter/material.dart';

class GestionUsuarios extends StatelessWidget {
  const GestionUsuarios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //var buscadorcontroller = TextEditingController();
    return Scaffold(
        appBar: AppBar(title: const Text("MANTENIMIENTO DE USUARIOS")),
        body: Container(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            width: size.width * 0.2,
            height: size.height * 0.3,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
              left: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
              right: BorderSide(width: 1.0, color: Color(0xFF000000)),
              bottom: BorderSide(width: 1.0, color: Color(0xFF000000)),
            )),
            child: const Text(
              "USUARIO",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Color(0xff525252)),
            ),
          ),
        ));
  }
}
