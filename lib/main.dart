import 'package:flutter/material.dart';
import 'package:soft_frontend/screens/screens.dart';

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
      initialRoute: 'mostrar_Arqueo',
      routes: {
        'login': (_) => const Login(),
        'pantalla_principal': (_) => const PantallaPrincipal(),
        'mantenimiento': (_) => const Mantenimiento(),
        'crear_cliente': (_) => CrearClientes(),
        'mostrar_arqueo': (_) => MostrarArqueo(),
      },
    );
  }
}
