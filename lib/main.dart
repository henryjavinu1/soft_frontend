import 'package:flutter/material.dart';
import 'package:soft_frontend/screens/cliente/todosLosClientes.screen.dart';
import 'package:soft_frontend/screens/empleado/crearEmpleado.screen.dart';
import 'package:soft_frontend/screens/manipularFactura/manipularfactura.screen.dart';
import 'package:soft_frontend/screens/screens.dart';
import 'package:soft_frontend/screens/tipoPago/buscarTipoPago.screen.dart';
import 'package:soft_frontend/screens/tipoPago/crearTipoPago.screen.dart';
import 'package:soft_frontend/screens/user/creauser.scree.dart';
import 'package:soft_frontend/screens/rol/crearol.screen.dart';
import 'package:soft_frontend/screens/arqueo/mostrarArqueo.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soft',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'traer_arqueo',
      routes: {
        'login': (_) => const Login(),
        'pantalla_principal': (_) => const PantallaPrincipal(),
        'mantenimiento': (_) => const PantallaMantenimientoPrincipal(),
        'crear_cliente': (_) => CrearClientes(),
        'crear_empleado': (_) => crearEmpleados(),
        'traer_clientes': (_) => const TodosLosClientes2(),
        'crearUsuarios': (_) => CrearUser(),
        'crearRol': (_) => CrearRol(),
        'gestionUsuarios': (_) => GestionUsuarios(),

        //'buscar_cliente': (_) => BuscarClientes(),
        'manipular_factura': (_) => ManipularFactura(),
        'talonarios': (_) => TalonariosScreen(),
        'listar_tipopago': (_) => BuscarTipoPago(),
        'crear_tipopago': (_) => CrearTipoPagos(),
        'traer_arqueo': (_) => const MostrarArqueos(),
        'mostrar_arqueo': (_) => MostrarArqueos(),
        'PrincipalVenta': (_) => PantallaPrincipalVenta(),
        'PrincipalGestion': (_) => PantallaGestionPrincipal(),
      },
    );
  }
}
