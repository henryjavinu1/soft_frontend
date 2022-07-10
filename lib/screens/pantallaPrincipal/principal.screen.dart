import 'package:flutter/material.dart';
import 'package:soft_frontend/screens/screens.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({Key? key}) : super(key: key);

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const PantallaPrincipalMovil();
        } else {
          return const PantallaPrincipalDesktop();
        }
      }),
    );
  }
}
