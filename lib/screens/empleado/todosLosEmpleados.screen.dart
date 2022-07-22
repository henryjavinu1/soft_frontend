import 'package:flutter/material.dart';
import 'package:soft_frontend/services/cliente.service.dart';
import '../../models/cliente.model.dart';

class TodosLosEmpleados2 extends StatefulWidget {
  const TodosLosEmpleados2({Key? key}) : super(key: key);

  @override
  State<TodosLosEmpleados2> createState() => _TodosLosEmpleados2State();
}

class _TodosLosEmpleados2State extends State<TodosLosEmpleados2> {
  List<TodoslosCliente> listaClientes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modulo Clientes")
      ),
        body: FutureBuilder(
      future: traerClientes(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          Cliente lista = snapshot.data;
          listaClientes = lista.todoslosClientes;
          return Padding(          
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "crear_cliente");
                      },
                      child: Container(
                          width: size.width * 0.2,
                          padding: const EdgeInsets.all(15),
                          child: const Text(
                            "Crear Cliente",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff525252)),
                          )),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xffD9D9D9)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "crear_cliente");
                      },
                      child: Container(
                          width: size.width * 0.2,
                          padding: const EdgeInsets.all(15),
                          child: const Text(
                            "Actualizar Cliente",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff525252)),
                          )),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xffD9D9D9)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "crear_cliente");
                      },
                      child: Container(
                          width: size.width * 0.2,
                          padding: const EdgeInsets.all(15),
                          child: const Text(
                            "Eliminar Cliente",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, color: Color(0xff525252)),
                          )),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xffD9D9D9)),
                      ),
                    ),
                    const SizedBox(height: 50,),
                    

                  ],
                ),
                const SizedBox(height: 40,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ListView.separated(
                                itemBuilder: (_, i) => item(listaClientes[i]),
                                itemCount: lista.todoslosClientes.length,
                                separatorBuilder: (_, i) => const Divider(),
                              ),
                    ),
                  ),
                ),
          
              ],
            
            ),
          );
          
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }

  Widget item(TodoslosCliente lista) {
    return Row(
      children: [
        Expanded(flex: 4, child: Text(lista.dni)),
        Expanded(flex: 4, child: Text(lista.nombreCliente)),
        const SizedBox(
          width: 10,
        ),
        Expanded(flex: 3, child: Text(lista.direccion)),
        Expanded(flex: 3, child: Text(lista.email)),
        Expanded(flex: 3, child: TextButton(child: Text("Actualizar"), onPressed: (){Navigator.pushNamed(context, "actualizar_clientes");},)),
        Expanded(flex: 3, child: TextButton(child: Text("Eliminar"), onPressed: (){Navigator.pushNamed(context, "actualizar_clientes");},)),
      ],
    );
  }
}
