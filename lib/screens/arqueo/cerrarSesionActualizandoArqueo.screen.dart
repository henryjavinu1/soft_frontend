import 'package:flutter/material.dart';
import '../../services/cerrarSesionActualizandoArqueo.service.dart';

class ActualizarArqueCerrandoSesion extends StatefulWidget {
  @override
  State<ActualizarArqueCerrandoSesion> createState() =>
      _ActualizarArqueCerrandoSesionState();
}

class _ActualizarArqueCerrandoSesionState
    extends State<ActualizarArqueCerrandoSesion> {
  var idUsuarioController = TextEditingController();
  var idSesionController = TextEditingController();
  var idArqueoController = TextEditingController();

  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: constraints.maxWidth < 500
                ? const EdgeInsets.all(20)
                : const EdgeInsets.all(30.0),
            color: const Color(0xffF3F3F3),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cerrar Sesión Actualizando Arqueo",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    "Por favor llene los campos",
                    style: TextStyle(fontSize: 15, color: Color(0xff606060)),
                  ),
                  const SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 500,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Id De Usuario",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: idUsuarioController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder()),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Id De Sesion",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: idSesionController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder()),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Id De Arqueo",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: idArqueoController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder()),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              TextButton(
                                onPressed: null,
                                child: Center(
                                  child: ElevatedButton(
                                      onPressed: () =>
                                          ActualizarArqueoCerrandoSesion(
                                              idSesionController.text,
                                              idUsuarioController.text,
                                              idArqueoController.text,
                                              context),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Text('Continuar'),
                                      )),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }));
}
