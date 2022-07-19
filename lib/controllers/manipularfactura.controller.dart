import 'package:flutter/material.dart';

import '../models/models.dart';
import '../models/unaFacturaBuscada.model.dart';
import '../screens/manipularFactura/components/dialogMensajeProblema.component.dart';
import '../screens/manipularFactura/components/dialogVerFactura.component.dart';
import '../screens/mostrarUnaFactura/mostrarunafactura.screen.dart';
import '../services/manipularfactura.service.dart';

typedef void ListFactura(List<FacturaBuscada> facturasBuscadas);

Future listarFacturas() async{
  final response  = await traerFactura();
  if (response is ManipularFacturaResponse) {
    return response;
  } else if(response == 2) {
    return 2;
  }
}

Future filtrarFacturasPorNombreCliente(
    TextEditingController controller, ListFactura callback, context) async {
  final response =
      await filtrarFacturasPorCliente(controller.text.trim(), '', '');
  if (response is List<FacturaBuscada>) {
    callback(response);
  } else if (response == 404) {
    dialogMensajeProblema(context,
        'No se encontró ningúna factura para el cliente: ${controller.text.trim()}');
  }
}

Future filtrarFacturasPorRTNCliente(TextEditingController _textController,
    ListFactura callback, context) async {
  final response =
      await filtrarFacturasPorCliente('', _textController.text.trim(), '');
  if (response is List<FacturaBuscada>) {
    callback(response);
  } else if (response == 404) {
    dialogMensajeProblema(context,
        'No se encontró ningún resultado para la factura con RTN: ${_textController.text.trim()}');
  } else if (response is MensajePeticion) {
    MensajePeticion mensajeError = response;
    dialogMensajeProblema(context, mensajeError.msg);
  }
}

Future filtrarFacturasPorDNICliente(TextEditingController _textController,
    ListFactura callback, context) async {
  final response =
      await filtrarFacturasPorCliente('', '', _textController.text.trim());
  if (response is List<FacturaBuscada>) {
    callback(response);
  } else if (response == 404) {
    dialogMensajeProblema(context,
        'No se encontró ningún resultado para facturas con DNI: ${_textController.text.trim()}');
  } else if (response is MensajePeticion) {
    MensajePeticion mensajeError = response;
    dialogMensajeProblema(context, mensajeError.msg);
  }
}

Future filtrarFacturasPorFechaController(
    TextEditingController _textController,
    TextEditingController _textController2,
    ListFactura callback,
    context) async {
  if (_textController2.text.isEmpty) {
    final response =
        await filtrarFacturasPorFecha(_textController.text.trim(), '');
    if (response is List<FacturaBuscada>) {
      callback(response);
    } else if (response == 404) {
      dialogMensajeProblema(context,
          'No se encontró ningúna factura el día: ${_textController.text.trim()}');
    } else if (response is MensajePeticion) {
      MensajePeticion mensajeError = response;
      dialogMensajeProblema(context, mensajeError.msg);
    }
    // Si ambos campos tienen datos
  } else {
    final response = await filtrarFacturasPorFecha(
        _textController.text.trim(), _textController2.text.trim());
    if (response is List<FacturaBuscada>) {
      callback(response);
    } else if (response == 404) {
      dialogMensajeProblema(context,
          'No se encontró ningúna factura el ${_textController.text.trim()} y el ${_textController2.text.trim()}');
    } else if (response is MensajePeticion) {
      MensajePeticion mensajeError = response;
      dialogMensajeProblema(context, mensajeError.msg);
    }
  }
}

Future filtrarFacturasPorIdTalonario(TextEditingController _textController,
    ListFactura callback, context) async {
  final response =
      await filtrarFacturasPorTalonario(_textController.text.trim(), '');
  if (response is List<FacturaBuscada>) {
    callback(response);
    // Si no encontró ningúna coincidencia.
  } else if (response == 404) {
    dialogMensajeProblema(context,
        'No se encontró ningúna factura con el id de talonario: ${_textController.text.trim()}');
  } else if (response is MensajePeticion) {
    MensajePeticion mensajeError = response;
    dialogMensajeProblema(context, mensajeError.msg);
  }
}

Future filtrarFacturasPorCAI(TextEditingController _textController,
    ListFactura callback, context) async {
  final response =
      await filtrarFacturasPorTalonario('', _textController.text.trim());
  if (response is List<FacturaBuscada>) {
    callback(response);
    // Si no encontró ningúna coincidencia.
  } else if (response == 404) {
    dialogMensajeProblema(context,
        'No se encontró ningúna factura con el cai de talonario: ${_textController.text.trim()}');
  } else if (response is MensajePeticion) {
    MensajePeticion mensajeError = response;
    dialogMensajeProblema(context, mensajeError.msg);
  }
}

Future filtrarFacturasPorIdEmpleado(TextEditingController _textController,
    ListFactura callback, context) async {
  final response =
      await filtrarFacturasPorEmpleado(_textController.text.trim());
  if (response is List<FacturaBuscada>) {
    callback(response);
  } else if (response == 404) {
    dialogMensajeProblema(context,
        'No se encontró ningúna factura con el id de empleado: ${_textController.text.trim()}');
  } else if (response is MensajePeticion) {
    MensajePeticion mensajeError =
        await filtrarFacturasPorEmpleado(_textController.text.trim());
    dialogMensajeProblema(context, mensajeError.msg);
  }
}

Future buscarFacturaPorNumeroFact(
    TextEditingController _textController, Size size, context) async {
  final response = await buscarFacturaPorNumero(_textController.text.trim());
  if (response is UnaFacturaBuscada) {
    UnaFacturaBuscada facturaBuscada = response;
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Resultado de la búsqueda'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  textAlertDialogFactura(
                      'Número de factura',
                      'Fecha de emisión',
                      'Empleado',
                      facturaBuscada.unafactura.numeroFactura.toString(),
                      facturaBuscada.unafactura.fechaFactura.toString(),
                      facturaBuscada.unafactura.empleado!.nombre.toString() +
                          ' ' +
                          facturaBuscada.unafactura.empleado!.apellido.toString()),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  textAlertDialogFactura(
                      'Nombre de cliente',
                      'RTN',
                      'CAI',
                      facturaBuscada.unafactura.cliente!.nombreCliente
                          .toString(),
                      facturaBuscada.unafactura.cliente!.rtn.toString(),
                      facturaBuscada.unafactura.talonario!.cai.toString()),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  textAlertDialogFactura('Total de factura', '', '',
                      facturaBuscada.unafactura.totalFactura, '', ''),
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MostrarFactura(
                                  numeroFactura: facturaBuscada
                                      .unafactura.numeroFactura)));
                    },
                    child: Text('Ver factura')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cerrar')),
              ],
            ));
  } else if (response == 404) {
    dialogMensajeProblema(context,
        'No se encontró ningún resultado para la factura con número: ${_textController.text.trim()}');
  }
}

