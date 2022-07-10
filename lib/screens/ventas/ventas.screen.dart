// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Ventas extends StatefulWidget {
  const Ventas({Key? key}) : super(key: key);

  @override
  State<Ventas> createState() => _VentasState();
}

class _VentasState extends State<Ventas> {
  var rtnController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.account_circle_rounded),
                      Text("Nombre de Usuario")
                    ],
                  ),
                  const Text("Nombre de Empresa"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("9 Jueves 2022"),
                      Text("10:00 AM"),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("RTN de cliente"),
                          Container(
                            width: size.width *0.2,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.search),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Identidad de Cliente"),
                          Container(
                            width: size.width *0.2,
                            child: TextFormField(),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.search),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nombre de Cliente"),
                          Container(
                            width: size.width *0.2,
                            child: TextFormField(),
                          ),
                        ],
                      ),

                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Telefono de Cliente"),
                          Container(
                            width: size.width *0.2,
                            child: TextFormField(),
                          ),
                        ],
                      ),

                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}