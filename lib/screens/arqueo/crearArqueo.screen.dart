//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:soft_frontend/services/arqueo.service.dart';

class CrearArqueo extends StatefulWidget {
  @override
  State<CrearArqueo> createState() => _CrearArqueoState();
}

class _CrearArqueoState extends State<CrearArqueo> {
  var idUsuarioController = TextEditingController();
  var idSesionController = TextEditingController();
  var efectivoAperturaController = TextEditingController();

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
                    "Crear Arqueo",
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
                              const Text(
                                "Id Usuario",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: idUsuarioController,
                                decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: "Id Usuario"),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Id Sesion",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: idSesionController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: "Id Sesion"),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Efectivo Apertura",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: efectivoAperturaController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: "Efectivo Apertura"),
                              ),
                              const SizedBox(height: 20),
                              TextButton(
                                onPressed: null,
                                child: Center(
                                  child: ElevatedButton(
                                      onPressed: () => createArqueo(
                                          idSesionController.text,
                                          idUsuarioController.text,
                                          efectivoAperturaController.text,
                                          context),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Text('crear Arqueo'),
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
