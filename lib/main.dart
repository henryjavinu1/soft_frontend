import 'package:flutter/material.dart';
import 'package:soft_frontend/constans.dart';
import 'package:soft_frontend/models/models.dart';
import 'package:soft_frontend/models/mostrarUnaFactura.model.dart';
import 'package:soft_frontend/screens/arqueo/buscarArqueoIdUsuario.screen.dart';
import 'package:soft_frontend/screens/arqueo/crearArqueo.screen.dart';
import 'package:soft_frontend/screens/cliente/todosLosClientes.screen.dart';
import 'package:soft_frontend/screens/empleado/crearEmpleado.screen.dart';
import 'package:soft_frontend/screens/generarFactura/escogerVenta.screen.dart';
import 'package:soft_frontend/screens/manipularFactura/manipularfactura.screen.dart';
import 'package:soft_frontend/screens/screens.dart';
import 'package:soft_frontend/screens/sucursal/sucursal.screen.dart';
import 'package:soft_frontend/screens/tipoPago/buscarTipoPago.screen.dart';
import 'package:soft_frontend/screens/user/creauser.scree.dart';
import 'package:soft_frontend/screens/rol/crearol.screen.dart';
import 'package:soft_frontend/screens/tipoproducto/tipoproducto.screen.dart';
import 'package:soft_frontend/screens/producto/producto.screen.dart';
import 'package:soft_frontend/screens/arqueo/mostrarArqueo.screen.dart';
import 'package:soft_frontend/screens/producto/producto.screen.dart';
import 'package:soft_frontend/screens/gestionusuarios/gestionusuarios.screen.dart';
import 'package:soft_frontend/screens/rol/gestionroles.screen.dart';
import 'package:soft_frontend/screens/user/updateuser.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: snackbarKey,
      debugShowCheckedModeBanner: false,
      title: 'Soft',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'login',
      routes: {
        'login': (_) => const Login(),

        'pantalla_principal': (_) => const PantallaPrincipal(),
        'mantenimiento': (_) => const PantallaMantenimientoPrincipal(),
        'crear_cliente': (_) => CrearClientes(),
        'traer_clientes': (_) => const TodosLosClientes2(),
        'crear_empleado': (_) => crearEmpleados(),
        'traer_empleados': (_) => const TodosLosEmpleados2(),
        //'crearUsuarios': (_) => CrearUser(),
        'crearRol': (_) => CrearRol(),
        'gestionUsuarios': (_) => const MostrarUsuarios(),
        'ventas': (_) => const VentanaVenta(),
        'gestionRol': (_) => const MostrarRol(),
        //'buscar_cliente': (_) => BuscarClientes(),
        'manipular_factura': (_) => ManipularFactura(),
        'talonarios': (_) => TalonariosScreen(),
        'sucursal': (_) => SucursalScreen(),
        'listar_tipopago': (_) => BuscarTipoPago(),
        'traer_arqueo': (_) => const MostrarArqueos(),
        'crear_arqueo': (_) => const CrearArqueo(),
        'PrincipalVenta': (_) => PantallaPrincipalVenta(),
        'PrincipalGestion': (_) => PantallaGestionPrincipal(),
        'PantallaTipoProductos': (_) => PantallaTipoProducto(),
        'PantallaProductos': (_) => PantallaProducto(),
        'mostrar_ventas': (_) => EscogerVentaPrueb(),
      },
    );
  }
}
