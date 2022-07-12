import 'package:flutter/material.dart';
import 'package:soft_frontend/services/eliminarTipoPago.service.dart';
import '../../models/tipoPagoBuscado.model.dart';

class EliminarTipoPagos extends StatefulWidget {
  final TipoPagoBuscado tipoPago;
  const EliminarTipoPagos({Key? key, required this.tipoPago}) : super(key: key);
  @override
  State<EliminarTipoPagos> createState() => _EliminarTipoPagosState();
}

class _EliminarTipoPagosState extends State<EliminarTipoPagos> {
  var idTipoPagoController = TextEditingController();
  @override
  Widget build(context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        idTipoPagoController.text = widget.tipoPago.idTipoPago.toString();
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
                    "Eliminar un nuevo Tipo De Pago",
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
                                "id De Pago",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextFormField(
                                controller: idTipoPagoController,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder()),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              TextButton(
                                onPressed: null,
                                child: Center(
                                  child: ElevatedButton(
                                      onPressed: () => EliminarTipoPago(
                                          idTipoPagoController.text, context),
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
                  )
                ],
              ),
            ),
          ),
        );
      }));
}
