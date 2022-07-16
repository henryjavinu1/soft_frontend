import 'package:flutter/material.dart';
import 'package:soft_frontend/services/cliente.service.dart';

import '../../models/cliente.model.dart';

class TodosLosClientes2 extends StatefulWidget {
  const TodosLosClientes2({Key? key}) : super(key: key);

  @override
  State<TodosLosClientes2> createState() => _TodosLosClientes2State();
}

class _TodosLosClientes2State extends State<TodosLosClientes2> {
  List<TodoslosCliente> listaClientes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: traerClientes(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          Cliente lista = snapshot.data;
          listaClientes = lista.todoslosClientes;
          return Center(
            child: ListView.separated(
              itemBuilder: (_, i) => item(listaClientes[i]),
              itemCount: lista.todoslosClientes.length,
              separatorBuilder: (_, i) => Divider(),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }

  Widget item(TodoslosCliente lista) {
    return Row(
      children: [
        Expanded(flex: 4, child: Text(lista.nombreCliente)),
        SizedBox(
          width: 10,
        ),
        Expanded(flex: 3, child: Text(lista.direccion)),
        Expanded(flex: 1, child:Text(lista.email)),
      ],
    );
  }
}
