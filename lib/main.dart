import 'package:flutter/material.dart';
import 'package:soft_frontend/screens/cliente/todosLosClientes.screen.dart';
import 'package:soft_frontend/screens/empleado/crearEmpleado.screen.dart';
import 'package:soft_frontend/screens/manipularFactura/manipularfactura.screen.dart';
import 'package:soft_frontend/screens/screens.dart';
import 'package:soft_frontend/screens/tipoPago/buscarTipoPago.screen.dart';
import 'package:soft_frontend/screens/tipoPago/crearTipoPago.screen.dart';
<<<<<<< HEAD
import 'package:soft_frontend/services/empleado.service.dart';
=======
import 'package:soft_frontend/screens/tipoproducto/tipoproducto.screen.dart';
import 'package:soft_frontend/screens/producto/producto.screen.dart';
>>>>>>> branchAstrid
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
        'traer_empleados': (_) => const TodosLosEmpleados2(),

        //'buscar_cliente': (_) => BuscarClientes(),
        'manipular_factura': (_) => ManipularFactura(),
        'talonarios': (_) => TalonariosScreen(),
        'listar_tipopago': (_) => BuscarTipoPago(),
        'crear_tipopago': (_) => CrearTipoPagos(),
        'traer_arqueo': (_) => const MostrarArqueos(),
        'PrincipalVenta': (_) => PantallaPrincipalVenta(),
        'PrincipalGestion': (_) => PantallaGestionPrincipal(),
        'PantallaTipoProductos': (_) => PantallaTipoProducto(),
        'PantallaProductos': (_) => PantallaProducto(),
      },
    );
  }
}
