// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:soft_frontend/services/cliente.service.dart';

class CrearClientes extends StatefulWidget {
  @override
  State<CrearClientes> createState() => _CrearClientesState();
}

class _CrearClientesState extends State<CrearClientes> {
  var dniController = TextEditingController();
  var rtnController = TextEditingController();
  var nombreController = TextEditingController();
  var direccionController = TextEditingController();
  var telefonoController = TextEditingController();
  var emailController = TextEditingController();

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
                    "Crear Cliente",
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
                                "Identificacion/DNI",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: dniController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: '060190900404'),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "RTN (Opcional)",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: rtnController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: '0601909004043'),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Nombre",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: nombreController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Juan'),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Direccion",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: direccionController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Barrio las vegas'),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Telefono",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: telefonoController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: '27820000'),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Email",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Example@dominio.com'),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              TextButton(
                                onPressed: null,
                                child: Center(
                                  child: ElevatedButton(
                                      onPressed: () => crearCliente(
                                          dniController.text,
                                          emailController.text,
                                          rtnController.text,
                                          nombreController.text,
                                          direccionController.text,
                                          telefonoController.text,
                                          context),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Text('Aceptar'),
                                      )),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }));
}
